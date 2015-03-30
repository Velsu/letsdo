class AddChildCostToUsers < ActiveRecord::Migration
  def change
    add_column :users, :child_cost, :text
  end
end
