module API
  module V1
    class Locations<Grape::API
      version 'v1', using: :path
      format 'json'
      default_format :json

      resources :locations do
        desc 'get all locations'

        get '' do
          Location.all
        end
      end

    end
  end
end