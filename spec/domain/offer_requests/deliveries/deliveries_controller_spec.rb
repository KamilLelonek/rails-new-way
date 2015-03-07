RSpec.describe OfferRequests::Deliveries::DeliveriesController, type: :controller do
  let(:app) { AppCreator.new }
  let(:dummy_records) do
    10.times.map do
      OfferRequests::Deliveries::DeliveryEntity.new(
        id:          SecureRandom.uuid,
        name:        Faker::Lorem.word,
        description: Faker::Lorem.paragraph,
      )
    end
  end

  before do
    expect(controller)
      .to receive(:get_all_deliveries)
      .and_return(app.get_all_deliveries)

    app.delivery_adapter.all = dummy_records
  end

  it 'renders json with all deliveries' do
    xhr :get, :index
    expect(response.body).to be_json_eql dummy_records.to_json
  end
end
