class AddLocationToConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :location, :string
  end
end
