module API
  module V1
    class Base<Grape::API
      mount API::V1::Places
      mount API::V1::Categories
      mount API::V1::Locations
    end
  end
end