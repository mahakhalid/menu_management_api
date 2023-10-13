# frozen_string_literal: true
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001' # https://specific-origin.com since this is just for testing , keeping it simple
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
  