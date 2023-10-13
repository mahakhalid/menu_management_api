# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Menus routes', type: :routing do
  it 'routes to the menus index page' do
    expect(get: '/menus').to route_to('menus#index')
  end
end