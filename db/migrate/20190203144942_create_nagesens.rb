class CreateNagesens < ActiveRecord::Migration[5.2]
  def change
    create_table :nagesens do |t|
      t.integer :user_id
      t.integer :receive_user_id
      t.integer :content_id

      t.timestamps
    end
  end
end
