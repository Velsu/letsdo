class ChangeCostDefaultInPlaces < ActiveRecord::Migration
  def change
    change_column_default :places, :cost, 0.00
  end
end
