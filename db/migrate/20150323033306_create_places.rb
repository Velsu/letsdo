class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.text :s_description
      t.text :l_description
      t.float :cost
      t.string :address
      t.string :phone
      t.boolean :outdoor
      t.string :website
      t.url :picture
      t.integer :min_age
      t.boolean :verified
      t.float :l_time
      t.string :op_hours

      t.timestamps null: false
    end
  end
end
