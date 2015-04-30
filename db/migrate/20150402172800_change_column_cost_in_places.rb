class ChangeColumnCostInPlaces < ActiveRecord::Migration
  def change
    change_column :places, :cost, :decimal, precision: 5, scale: 2
  end
end
