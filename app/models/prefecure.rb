class Prefecure < ApplicationRecord
  has_many :post_prefecure_relations, dependent: :destroy
  has_many :posts, through: :post_prefecure_relations, dependent: :destroy
end
