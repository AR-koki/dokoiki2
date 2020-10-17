class PostPrefecureRelation < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :prefecure, optional: true
end
