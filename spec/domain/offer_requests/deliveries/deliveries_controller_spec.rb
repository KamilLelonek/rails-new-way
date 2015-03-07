RSpec.describe OfferRequests::Deliveries::DeliveriesController, type: :controller do
  let(:app)   { AppCreator.new   }
  let(:store) { SharedModels.new }

  before do
    expect(controller)
      .to receive(:get_all_deliveries)
      .and_return(app.get_all_deliveries)

    app.delivery_adapter.all = store.deliveries
  end

  it 'renders json with all deliveries' do
    xhr :get, :index
    expect(response.body).to be_json_eql store.deliveries.to_json
  end
end
