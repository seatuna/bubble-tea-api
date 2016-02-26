require 'rails_helper'

RSpec.describe DrinksController do
  def drink_params
    {
      name: 'Red Wow Milk',
      ingredients: 'Milk',
      toppings: 'Red bean, tapioca pearls'
    }
  end

  after(:each) do
    Drink.delete_all
  end

  describe 'POST signup' do
    before(:each) do
      post :signup, { credentials: drink_params }, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_nil
    end
  end

  describe 'POST signin' do
    before(:each) do
      post :signup, { credentials: drink_params }, format: :json
      post :signin, { credentials: drink_params }, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_nil
    end
  end

  context 'when authenticated' do
    before(:each) do
      post :signup, { credentials: drink_params }, format: :json
      post :signin, { credentials: drink_params }, format: :json

      @token = JSON.parse(response.body)['drink']['token']
      request.env['HTTP_AUTHORIZATION'] = "Token token=#{@token}"

      @drink_id = JSON.parse(response.body)['drink']['id']
    end

    describe 'PATCH changepw' do
      def new_password_params
        {
          old: 'foobarbaz',
          new: 'foobarbazqux'
        }
      end

      before(:each) do
        patch :changepw,
              { id: @drink_id, passwords: new_password_params },
              format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders no response body' do
        expect(response.body).to be_empty
      end
    end

    describe 'DELETE signout' do
      before(:each) do
        delete :signout, id: @drink_id, format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders no response body' do
        expect(response.body).to be_empty
      end
    end

    describe 'GET index' do
      before(:each) do
        get :index, format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders a JSON response' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).not_to be_nil
      end
    end

    describe 'GET show' do
      before(:each) do
        get :index, id: @drink_id, format: :json
      end

      it 'is successful' do
        expect(response).to be_successful
      end

      it 'renders a JSON response' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).not_to be_nil
      end
    end
  end
end
