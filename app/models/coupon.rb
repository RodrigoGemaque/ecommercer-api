class Coupon < ApplicationRecord

  validates :name, presence: true
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :discount_value, presence: true, numericality: { greater_than: 0 }


  validates :due_date, presence: true, future_date: true
  validates :status, presence: true
  enum status: { active:1,  inactive: 2 } 

  #incluindo o concern paginatable
  include Paginatable
  include LikeSearchable

end
