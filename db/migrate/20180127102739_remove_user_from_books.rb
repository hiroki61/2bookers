class RemoveUserFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :user, :string
  end
end
