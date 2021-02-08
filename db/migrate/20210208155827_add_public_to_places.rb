class AddPublicToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :public, :boolean, default: true
  end
end
