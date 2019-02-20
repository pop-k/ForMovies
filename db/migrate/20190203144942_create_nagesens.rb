class CreateNagesens < ActiveRecord::Migration[5.2]
  def change
    create_table :nagesens, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :receive_user_id
      t.integer :content_id

      t.timestamps
    end
  end
end
