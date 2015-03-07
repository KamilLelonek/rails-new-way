RSpec.describe Juices::Categories::CategoriesController, type: :controller do
  let(:app)   { AppCreator.new   }
  let(:store) { SharedModels.new }

  before do
    expect(controller)
      .to receive(:get_all_categories)
      .and_return(app.get_all_categories)

    app.category_adapter.all = store.categories
  end

  it 'renders json with all categories' do
    xhr :get, :index
    expect(response.body).to be_json_eql store.categories.to_json
  end
end
