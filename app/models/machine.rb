class Machine < ApplicationRecord
  validates_presence_of :location
  has_many :snacks
  belongs_to :owner


  def average_snack_price
    snacks.average(:price)
  end

end
