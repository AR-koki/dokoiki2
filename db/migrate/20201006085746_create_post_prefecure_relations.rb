class CreatePostPrefecureRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_prefecure_relations do |t|

      t.integer :post_id
      t.integer :prefecure_id
      t.timestamps
    end
  end
end
