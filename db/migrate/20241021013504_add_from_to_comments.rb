class AddFromToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :from, :string
  end
end
