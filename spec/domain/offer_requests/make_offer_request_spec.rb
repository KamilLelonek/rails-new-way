RSpec.describe UseCases::MakeOfferRequest do
  let(:app)   { AppCreator.new   }
  let(:store) { SharedModels.new }

  before do
    app.delivery_adapter.all = store.deliveries
    app.category_adapter.all = store.categories
  end

  let(:valid_params) do
    {
      customer_name:   Faker::Name.name,
      customer_email:  Faker::Internet.email,
      delivery_id:     store.deliveries.sample.id,
      company_name:    Faker::Company.name,
      company_phone:   Faker::PhoneNumber.short_phone_number,
      company_address: Faker::Address.secondary_address,
      products:        [{ category_id: store.categories.sample.id, quantity: 1 }]
    }
  end

  def use_case
    described_class.new(
      app.offer_request_repository,
      app.category_repository,
      app.delivery_repository,
      app.offer_request_read_model_repository
    )
  end

  context 'Validation check' do
    it 'cannot make an offer with missing attributes' do
      expect_to_have_invalid({}, *valid_params.keys)
    end

    it 'cannot make an offer with missing attributes' do
      valid_params.keys.each do |key|
        expect_to_have_invalid(valid_params.except(key), key)
      end
    end

    it 'cannot make an offer with missing attributes' do
      expect_to_have_invalid(
        valid_params.except(:customer_email),
        :customer_email
      )
    end

    it 'cannot make an offer with invalid attributes format' do
      expect_to_have_invalid(
        valid_params.merge(delivery_id: '12345'),
        :delivery_id
      )
      expect_to_have_invalid(
        valid_params.merge(delivery_period: 500),
        :delivery_period
      )
      expect_to_have_invalid(
        valid_params.merge(customer_email: 'example.com'),
        :customer_email
      )
      expect_to_have_invalid(
        valid_params.merge(company_phone: '+4 403 432'),
        :company_phone
      )
      expect_to_have_invalid(
        valid_params.merge(cvr: 123456),
        :cvr
      )
      expect_to_have_invalid(
        valid_params.merge(products: [{ quantity: 0, category_id: 0 }]),
        :'products.quantity'
      )
    end

    it 'cannot make an offer without request products' do
      expect_to_have_invalid(
        valid_params.merge(products: nil),
        :products
      )
      expect_to_have_invalid(
        valid_params.merge(products: []),
        :products
      )
    end

    it 'cannot make an offer with invalid products list' do
      expect_to_have_invalid(
        valid_params.merge(products: [{}]),
        :'products.category_id', :'products.quantity'
      )
    end

    it 'cannot make an offer with missing product parameters' do
      expect_to_have_invalid(
        valid_params.merge(products: [{ quantity: 1 }]),
        :'products.category_id'
      )
      expect_to_have_invalid(
        valid_params.merge(products: [{ category_id: 0 }]),
        :'products.quantity'
      )
    end

    def expect_to_have_invalid(params, *attributes)
      result = use_case.run(params)
      expect(result.value.errors).to include(*attributes)
      expect(result).to fail_with :invalid_attributes
    end
  end

  context 'Requesting with a correct offer' do
    specify do
      expect_successful_use_case
      expect_successful_storage
      expect_successful_dump
    end

    def expect_successful_use_case
      expect(use_case.run(valid_params)).to be_a_success
    end

    def expect_successful_storage
      expect(app.offer_request_in_memory_adapter.all)
        .to have_exactly(1).item
    end

    def expect_successful_dump
      expect(app.offer_request_in_memory_adapter.all.first.to_json)
        .to be_json_eql(app.get_all_offer_request_read_models.().first.dump.to_json)
    end
  end
end
