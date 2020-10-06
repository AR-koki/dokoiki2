class Post < ApplicationRecord
	belongs_to :user
	attachment :post_image, destroy: false
	#お気に入り
	has_many :favorites, dependent: :destroy

	#コメント
	has_many :comments, dependent: :destroy

	#カテゴリー
	has_many :post_category_relations
	has_many :categories, through: :post_category_relations

	#都道府県
	has_many :post_prefecure_relations
	has_many :prefecures, through: :post_prefecure_relations

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
