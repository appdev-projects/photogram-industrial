class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :comments_count
      t.integer :likes_count , default: 0
      t.text :caption , default: 0
      t.references :owner, null: false, foreign_key: { to_table: :users }
      # ...

      t.timestamps
    end
  end
end
