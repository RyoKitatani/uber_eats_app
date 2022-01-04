class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  belongs_to :order, optional: true
  # optiona: true => 外部キーのnilを許容する

  validates :count, numericality: {greater_than: 0}

  scope :active, -> {where(active: true)}
  scope :other_restaurant, -> (pickup_restaurant_id) {where.not(restaurant_id: pickup_restaurant_id)}

  def total_amount
    food.price * count
  end
end
