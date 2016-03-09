module API
  module V1
    class Places<Grape::API
      version 'v1', using: :path
      format 'json'
      default_format :json


      resource :places do

        desc 'Get places by category'
        params do
          optional :filter, type: String, desc: 'Filtering Criteria'
          optional :category_id, type: Integer
          optional :location_id, type: Integer
          optional :search_text, type: String
        end
        get ''  do
          if params[:filter].blank?
            Place.all
          else
            case params[:filter]
              when "categories"
                Place.find_by_category(params[:category_id])
              when "locations"
                Place.find_by_location(params[:location_id], params[:category_id])
              when "search"
                Place.find_by_search_text(params[:search_text])
            end
          end
        end
      end
    end
  end
end
