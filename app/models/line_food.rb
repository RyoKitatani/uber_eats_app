class LineFood < ApplicationRecord
  belongs_to :food
  belongs_to :restaunrant
  belongs_to :order, optional: true
  # optiona: true => 外部キーのnilを許容する

  validates :count, numericality: {greater_than: 0}

  scope :active, -> {where(active: true)}
  scope :other_restraunt, -> (pickup_restraunt_id) {(where.not(restaunrant_id: pickup_restraunt_id)}

  def total_amount
    food.price * count
  end
end
