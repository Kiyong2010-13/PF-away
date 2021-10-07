class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  belongs_to :customer
  belongs_to :genre
  attachment :post_image
  validates :title, presence: true
  validates :body, presence: true

  def good_by?(customer)
    goods.where(customer_id: customer.id).exists?
  end
end
