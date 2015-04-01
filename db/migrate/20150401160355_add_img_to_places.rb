class AddImgToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :img_file_name, :string
    add_column :places, :img_content_type, :string
    add_column :places, :img_file_size, :integer
    add_column :places, :img_updated_at, :datetime
  end
end
