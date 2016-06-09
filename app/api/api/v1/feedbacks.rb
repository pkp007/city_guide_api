module API
  module V1
    class Feedbacks<Grape::API
      version 'v1', using: :path
      format 'json'
      default_format :json

      resources :feedbacks do
        desc 'get the latest feedbacks'
        get '' do
          Feedback.all
        end


        get ':place_id/feedbacks' do
          @feedback = Feedback.get_feedback_messages(params[:place_id])
        end

        desc 'Create a feedback.'
        params do
          requires :feedback, type: Hash do
            requires :place_id , type: Integer, desc: "Id of the place on which feedback is given"
            optional :email, type: String, desc: "Email Address of a user"
            optional :deviceID, type: String, desc: "Adroid device Id. "
            optional :message, type: String, desc: "feedback message."
            optional :rating_value, type: Integer, desc: "user rating for the place ranges from 1 to 10."
            optional :likes, type: Boolean, desc: "Likes the place"
          end
        end
        post '' do
          @feedback = Feedback.create_or_update_feedback(params[:feedback][:place_id],params[:feedback][:email], params[:feedback][:deviceID], params[:feedback][:message], params[:feedback][:rating_value], params[:feedback][:likes])
          status 200
          @feedback
        end

      end

    end
  end
end
