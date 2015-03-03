RSpec.describe Juices::Categories::CategoriesController, type: :controller do
  let(:app) { AppCreator.new }
  let(:dummy_records) do
    10.times.map do
      OpenStruct.new(
        id:          SecureRandom.uuid,
        name:        Faker::Food.fruit.downcase,
        oz_capacity: rand(1..20)
      )
    end
  end

  before do
    expect(controller)
      .to receive(:get_all_categories)
      .and_return(app.get_all_categories)

    app.category_adapter.all = dummy_records
  end

  it 'renders json with all categories' do
    xhr :get, :index
    expect(response.body).to be_json_eql dummy_records.to_json
  end
end
