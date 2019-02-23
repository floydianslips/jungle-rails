class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates  :user_id, :product_id, :description, :rating, :presence => true
end
