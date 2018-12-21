class Snack < ApplicationRecord
  belongs_to :machine

  def locations
    require "pry"; binding.pry
    Snack.joins(:machine)
      .select(:)
  end
end
