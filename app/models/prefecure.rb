class Prefecure < ApplicationRecord
  has_many :post_prefecure_relations
  has_many :posts, through: :post_prefecure_relations
end
