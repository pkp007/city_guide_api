module API
  module V1
    class Categories<Grape::API

      version 'v1', using: :path
      format 'json'
      default_format :json

      resources :categories do

        desc 'Get all categories'
        get '' do
          Category.all
        end
      end
    end
  end
end