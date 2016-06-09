class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :deviceID
      t.string :email , default: " "
      t.string :message, default: " "
      t.boolean :likes , default: false
      t.float :rating_value
      t.timestamps null: false
    end
  end
end
