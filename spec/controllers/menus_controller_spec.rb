# frozen_string_literal: true
require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns JSON format' do
      get :index
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

    it 'returns all menus when no parameters are provided' do
      menu1 = create(:menu, name: 'Pizza', price: 10.0)
      menu2 = create(:menu, name: 'Burger', price: 5.0)

      get :index

      expect(JSON.parse(response.body).count).to eq(2)
    end

    it 'returns menus sorted by price in ascending order' do
      menu1 = create(:menu, name: 'Pizza', price: 10.0)
      menu2 = create(:menu, name: 'Burger', price: 5.0)

      get :index, params: { sort: 'price_asc' }

      prices = JSON.parse(response.body).map { |menu| menu['price'] }
      expect(prices).to eq(["10.0", "5.0"])
    end

    it 'returns menus sorted by price in descending order' do
      menu1 = create(:menu, name: 'Pizza', price: 10.0)
      menu2 = create(:menu, name: 'Burger', price: 5.0)

      get :index, params: { sort: 'price_desc' }

      prices = JSON.parse(response.body).map { |menu| menu['price'] }
      expect(prices).to eq(["10.0", "5.0"])
    end

    it 'returns menus filtered by name' do
      menu1 = create(:menu, name: 'Pizza', price: 10.0)
      menu2 = create(:menu, name: 'Burger', price: 5.0)

      get :index, params: { search: 'Pizza' }

      expect(JSON.parse(response.body).count).to eq(1)
    end
  end
end
