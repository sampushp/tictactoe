class AddWinRatioToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :win_ratio, :float, default: 0.0
  end
end
