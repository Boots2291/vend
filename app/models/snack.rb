class Snack < ApplicationRecord
  has_many :machines_snacks
  has_many :machines, through: :machines_snacks

  def self.average_price
    average(:price)
  end
end
