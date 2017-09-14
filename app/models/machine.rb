class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machines_snacks
  has_many :snacks, through: :machines_snacks
end
