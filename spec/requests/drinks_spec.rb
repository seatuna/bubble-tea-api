require 'rails_helper'

RSpec.describe 'Drinks API' do
  def drink_params
    {
      name: 'Red Wow Milk',
      ingredients: 'Milk',
      toppings: 'Red bean, tapioca pearls'
    }
  end

  def drinks
    Drink.all
  end

  def drink
    Drink.fourth
  end

  def user_params
    {
      email: 'alice@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def user
    User.first
  end

  before(:all) do
    User.create!(user_params)
    Drink.create!(drink_params)
  end

  after(:all) do
    Drink.delete_all
    User.delete_all
  end

  describe 'GET /drinks' do
    it 'lists all drinks' do
      get '/drinks'

      expect(response).to be_success

      drinks_response = JSON.parse(response.body)
      expect(drinks_response.length).to eq(drinks.count)
      expect(drinks_response['drinks'].fourth['name']).to eq(drink.name)
    end
  end

  describe 'GET /drinks/:id' do
    it 'shows one drink' do
      get "/drinks/#{drink.id}"

      expect(response).to be_success

      drink_response = JSON.parse(response.body)
      expect(drink_response['id']).to eq(drink.id)
      expect(drink_response['name']).to eq(drink.name)
    end
  end

  context 'when authenticated' do
    def headers
      {
        'HTTP_AUTHORIZATION' => "Token token=#{user.token}"
      }
    end

    describe 'POST /drinks' do
      it 'creates an drink' do
        post '/drinks', { drink: drink_params }, headers
        expect(response).to be_success

        drink_response = JSON.parse(response.body)
        expect(drink_response['id']).not_to be_nil
        expect(drink_response['name']).to eq(drink_params[:name])
      end
    end

    describe 'PATCH /drinks/:id' do
      def drink_diff
        { name: 'Red Bean Wow Milk' }
      end

      it 'updates an drink' do
        patch "/drinks/#{drink.id}", { drink: drink_diff }, headers

        expect(response).to be_success

        drink_response = JSON.parse(response.body)
        expect(drink_response['id']).to eq(drink.id)
        expect(drink_response['name']).to eq(drink_diff[:name])
      end
    end

    describe 'DELETE /drinks/:id' do
      it 'deletes an drink' do
        delete "/drinks/#{drink.id}", nil, headers

        expect(response).to be_success
        expect(response.body).to be_empty
      end
    end
  end

  context 'when not authenticated' do
    def headers
      {
        'HTTP_AUTHORIZATION' => nil
      }
    end

    describe 'POST /drinks' do
      it 'is not successful' do
        post '/drinks', nil, headers

        expect(response).not_to be_success
      end
    end

    describe 'PATCH /drinks/:id' do
      it 'is not successful' do
        patch "/drinks/#{drink.id}", nil, headers

        expect(response).not_to be_success
      end
    end

    describe 'DELETE /drinks/:id' do
      it 'is not successful' do
        delete "/drinks/#{drink.id}", nil, headers

        expect(response).not_to be_success
      end
    end
  end
end
