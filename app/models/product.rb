class Product < ApplicationRecord
  belongs_to :productable, polymorphic: true

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :featured, presence: true

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_one_attached :image   
  # has_many_attached :image
  validates :image, presence: true
  validates :status, presence: true


 enum status: { available: 1, unavailable: 2 }
  #incluindo os concerns 
  include LikeSearchable
  include Paginatable

end
