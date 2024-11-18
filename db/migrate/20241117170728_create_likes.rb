class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.bigint :fan_id
      t.bigint :photo_id

      t.timestamps
    end
  end
end
