module API
  module V1
    class Feedbacks<Grape::API
      version 'v1', using: :path
      format 'json'
      default_format :json

      resources :feedbacks do

        desc 'get the latest feedbacks'

        #sample url "localhost:3000/api/v1/feedbacks/122"
        get ':place_id' do

          params do
            optional :filter, type: String, desc: "filter criteria"
          end

          if params[:filter].blank?
            @feedback = Feedback.where(place_id: params[:place_id]).all
          else
            case params[:filter]
              when "message"
                Feedback.get_feedback_messages(params[:place_id])
              when "rating"
                Feedback.get_rating(params[:place_id])
              else
                @feedback = Feedback.where(place_id: params[:place_id]).all
            end
          end

        end

        desc 'Create a feedback.'
        params do
          requires :feedback, type: Hash do
            requires :place_id, type: Integer, desc: "Id of the place on which feedback is given"
            optional :email, type: String, desc: "Email Address of a user"
            optional :deviceID, type: String, desc: "Adroid device Id. "
            optional :message, type: String, desc: "feedback message."
            optional :rating_value, type: Integer, desc: "user rating for the place ranges from 1 to 10."
            optional :likes, type: Boolean, desc: "Likes the place"
          end
        end
        post '' do
          @feedback = Feedback.create_or_update_feedback(params[:feedback][:place_id], params[:feedback][:email], params[:feedback][:deviceID], params[:feedback][:message], params[:feedback][:rating_value], params[:feedback][:likes])
          status 200
          @feedback
        end

      end

      resources :like do

        get ':place_id' do
          @feedback = Feedback.get_no_of_likes(params[:place_id])
        end


        # TODO: Implement rating updates separately
        params do
          requires :like, type: Hash do
            requires :place_id, type: Integer, desc: "Id of the place on which feedback is given"
            optional :deviceID, type: String, desc: "Adroid device Id. "
          end
        end
        post '' do
          @feedback = Feedback.update_likes(params[:like][:place_id], params[:like][:deviceID])
          status 200
          @feedback
        end
      end

    end
  end
end
