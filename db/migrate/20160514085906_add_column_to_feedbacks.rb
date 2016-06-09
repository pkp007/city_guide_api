class AddColumnToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks ,:place_id ,:integer ,null: false
  end
end
