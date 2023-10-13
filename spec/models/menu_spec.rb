# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with valid attributes' do
    menu = Menu.new(name: 'Pizza', price: 10.0)
    expect(menu).to be_valid
  end

  it 'is not valid without a name' do
    menu = Menu.new(price: 10.0)
    expect(menu).to_not be_valid
  end

  it 'is not valid without a price' do
    menu = Menu.new(name: 'Burger')
    expect(menu).to_not be_valid
  end
end