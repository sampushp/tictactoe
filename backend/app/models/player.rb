# frozen_string_literal: true

class Player < ApplicationRecord
  after_save :calculate_win_ratio

  validates_presence_of :name

  def calculate_win_ratio
    update_column(:win_ratio, (wins.to_f / (wins + losses + draws)).round(2))
  end
end
