class Item < ApplicationRecord
  validates :name,                presence: true, length: { maximum: 40 }
  validates :price,               presence: true, numericality: {only_string: true, greater_than_or_equal_to: 300, less_than: 9999999} 
  validates :item_introduction,   presence: true, length: { maximum: 1000 }
  validates :condition,           presence: true
  validates :postage_payers,      presence: true
  validates :prefecture_id,       presence: true
  validates :preparation_period,  presence: true
  validates :item_images,         presence: true
  validates :name, presence: true

  has_many :item_images, dependent: :destroy 
  accepts_nested_attributes_for :item_images, allow_destroy: true
 

  belongs_to :category
  belongs_to :brand, optional: true
  

  belongs_to :seller, class_name: "User", foreign_key: 'seller_id'
  belongs_to :buyer, class_name:"User", optional: true, foreign_key: 'buyer_id'

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, dependent: :destroy
  belongs_to :brand, dependent: :destroy

end