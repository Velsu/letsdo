class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :adult, 1
  end
end
