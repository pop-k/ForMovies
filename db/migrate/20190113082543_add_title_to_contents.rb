class AddTitleToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :title, :string
  end
end
