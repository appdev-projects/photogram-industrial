class AddPhotosCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :photo_count, :integer
  end
end
