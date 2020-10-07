class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :category, null: false, default: 0
      t.integer :prefecure, null: false, default: 0
      t.string :post_image_id
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
end
