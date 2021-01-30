class Coupon < ApplicationRecord

  validates :code, presence: true, uniqueness: {case_sensitive: false}
  validates :status, presence: true
  
  validates :discount_value, presence: true, numericality: { greater_than: 0}


  validates :duedate, presence: true

  enum status: {active: 1, inactive: 2}
end
