RSpec.describe RootController do
  it 'routes / to root#index' do
    expect(get: '/').to route_to(
                          controller: 'root',
                          action:     'index'
                        )
  end

  it 'renders API urls' do
    xhr :get, :index
    expect(response).to be_success
    expect(response.body).to be_json_eql current_api
  end

  def current_api
    {
      categories:     "#{request.url}categories",
      ingredients:    "#{request.url}ingredients",
      deliveries:     "#{request.url}deliveries",
      offer_requests: "#{request.url}offer_requests",
    }.to_json
  end

  it 'provides routable paths' do
    expect(get: '/categories')    .to be_routable
    expect(get: '/ingredients')   .to be_routable
    expect(get: '/deliveries')    .to be_routable
    expect(get: '/offer_requests').to be_routable
  end
end
