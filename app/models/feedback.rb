class Feedback < ActiveRecord::Base


  def self.create_or_update_feedback (place_id, email, deviceID, message, rating_value, likes)

    @feedback = Feedback.where(deviceID: deviceID , place_id: place_id)

    if @feedback.present?
        # @feedback = Feedback.update( message: message, rating_value: rating_value)
        @feedback.update_all( message: message, rating_value: rating_value)

    else
      @feedback = Feedback.create!(place_id: place_id, email: email, deviceID: deviceID, message: message, rating_value: rating_value, likes: likes)
    end
  end

  def self.get_feedback_messages(place_id)
  @feedback = Feedback.select(:message).where(place_id: place_id).order('id DESC')
  end

  def self.get_rating(place_id)
  @feedback = Feedback.where(place_id: place_id).average(:rating_value)
  end

  def self.get_no_of_likes (place_id)
  @feedback = Feedback.where(place_id: place_id, likes: true).count()
  end

  def self.update_likes (place_id,deviceID)
    @feedback = Feedback.where(deviceID: deviceID , place_id: place_id)

    if @feedback.present?
      @feedback.update_all(likes:true)
    else
      @feedback = Feedback.create!(place_id: place_id,deviceID: deviceID, likes: true )
    end

  end
end
