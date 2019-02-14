class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :description
      t.integer :user_id
      t.string :video

      t.timestamps
    end
  end
end
