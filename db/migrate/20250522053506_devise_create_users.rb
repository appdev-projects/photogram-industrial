# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[8.0]
  def change
    enable_extension("citext")
    
    create_table :users do |t|
      ## Database authenticatable
      t.citext :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      
      # ... (keep existing Devise columns)
      
      t.citext :username
      t.string :name
      t.string :avatar_image
      t.string :bio
      t.string :website
      t.boolean :private
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :username,             unique: true
  end
end
