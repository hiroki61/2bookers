class AddUserToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :user, :string
  end
end
