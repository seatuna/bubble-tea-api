require 'rails_helper'

RSpec.describe 'routes for drinks' do
  it 'routes GET /drinks to the drinks#index action' do
    expect(get('/drinks')).to route_to('drinks#index')
  end

  it 'routes GET /drinks/:id to the drinks#show action' do
    expect(get('/drinks/1')).to route_to(
      controller: 'drinks',
      action: 'show',
      id: '1'
    )
  end

  it 'routes POST /drinks to the drinks#create action' do
    expect(post('/drinks')).to route_to('drinks#create')
  end

  it 'routes PATCH /drinks/:id to the drinks#update action' do
    expect(patch('/drinks/1')).to route_to(
      controller: 'drinks',
      action: 'update',
      id: '1'
    )
  end

  it 'routes DELETE /drinks/:id to the drinks#destroy action' do
    expect(delete('/drinks/1')).to route_to(
      controller: 'drinks',
      action: 'destroy',
      id: '1'
    )
  end
end
