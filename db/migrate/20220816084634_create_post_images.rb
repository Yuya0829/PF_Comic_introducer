class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      t.string :comic_name
      t.text :caption
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
