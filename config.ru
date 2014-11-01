# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000', 'localhost:4567'

    resource '/file/list_all/', :headers => 'x-domain-token'
    resource '/file/at/*',
        :methods => [:get, :post, :put, :delete, :options],
        :headers => 'x-domain-token',
        :max_age => 600
        # :expose  => ['Some-Custom-Response-Header'],
        # headers to expose
  end

  allow do
    origins '*'
  end
end

