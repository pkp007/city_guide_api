class Feedback < ActiveRecord::Base


  def self.create_or_update_feedback (place_id, email, deviceID, message, rating_value, likes)

    @feedback = Feedback.find_by_deviceID(deviceID)

    if @feedback.present?
      @feedback = Feedback.update_all(place_id, email: email, deviceID: deviceID, message: message, rating_value: rating_value, likes: likes)
    else
      @feedback = Feedback.create!(place_id: place_id, email: email, deviceID: deviceID, message: message, rating_value: rating_value, likes: likes)
    end
  end

  def self.get_feedback_messages(place_id)
    @feedback = Feedback.select(:message).where(place_id: place_id).order('id DESC')
  end

  def self.get_rating(place_id)
    @feedback = Feedback.average(:rating_value).where(place_id: place_id)
  end

  def self.get_no_of_likes (place_id)
    @feedback = Feedback.where(place_id: place_id, likes: true).count()
  end

end
