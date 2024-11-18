class CreateFollowRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :follow_requests do |t|
      t.string :status
      t.bigint :recipient_id
      t.bigint :sender_id

      t.timestamps
    end
  end
end
