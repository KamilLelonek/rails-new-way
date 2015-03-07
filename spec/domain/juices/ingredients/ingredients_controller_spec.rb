RSpec.describe Juices::Ingredients::IngredientsController, type: :controller do
  let(:app) { AppCreator.new }
  let(:dummy_records) do
    10.times.map do
      Juices::Ingredients::IngredientValueObject.new(name: Faker::Food.fruit.downcase)
    end
  end

  before do
    expect(controller)
      .to receive(:get_all_ingredients)
      .and_return(app.get_all_ingredients)

    app.ingredient_adapter.all = dummy_records
  end

  it 'renders json with all ingredients' do
    xhr :get, :index
    expect(response.body).to be_json_eql dummy_records.to_json
  end
end
