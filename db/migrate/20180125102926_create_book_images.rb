class CreateBookImages < ActiveRecord::Migration[5.1]
  def change
    create_table :book_images do |t|
      t.text :book_title
      t.text :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
