class Order < ApplicationRecord
  belongs_to :user
  has_many :placements, inverse_of: :order
  has_many :products, through: :placements
  before_validation :set_total!
  validates :user_id, presence: true
  validates_with EnoughProductsValidator

  def set_total!
    self.total = 0
    placements.each do |placement|
      self.total += placement.product.price * placement.quantity
    end
  end

  def build_placements_with_product_ids_and_quantities product_ids_and_quantities
    product_ids_and_quantities.each do |product_id_and_quantity|
      id, quantity = product_id_and_quantity

      self.placements.build(product_id: id, quantity: quantity)
    end
  end
end
