RSpec.describe 'healthcheck' do
  it 'is routed to healthcheck#index' do
    expect(get: '/healthcheck').to route_to(controller: 'healthcheck', action: 'index')
  end

  it 'is routed to /' do
    should route(:get, '/').to(controller: 'healthcheck', action: 'index')
  end
end
