class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :post_image
  # お気に入り
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  # コメント
  has_many :comments, dependent: :destroy

  # カテゴリー
  has_many :post_category_relations, dependent: :destroy
  has_many :categories, through: :post_category_relations, dependent: :destroy

  enum category: {
    "---": 0,
    風景: 1, お土産: 2, 観光地: 3, 食事: 4, その他: 5,
  }, _suffix: true

  # 都道府県
  has_many :post_prefecure_relations, dependent: :destroy
  has_many :prefecures, through: :post_prefecure_relations, dependent: :destroy

  enum prefecure: {
    "---": 0,
    北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7,
    茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
    新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
    岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
    滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
    鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
    徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
    福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46,
    沖縄県: 47,
  }, _suffix: true
  # お気に入り
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 月別集計
  def divide_monthly
    @archives = user.posts.group("strftime('%Y%m', posts.created_at)").
      order("strftime('%Y%m', posts.created_at) desc").
      count
  end

  def self.search(word)
    @post = Post.where("body LIKE?", "%#{word}%")
  end
  # バリデーション
  validates :body, presence: true
  validates :body, length: { maximum: 200 }
  validates :category, inclusion: { in: Post.categories.keys }
  validates :prefecure, inclusion: { in: Post.prefecures.keys }
end
