class CreatePostImageGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :post_image_genres do |t|

      t.integer :genre_id
      t.integer :post_image_id

      t.timestamps
    end
  end
end
