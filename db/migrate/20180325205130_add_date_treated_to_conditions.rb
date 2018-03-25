class AddDateTreatedToConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :date_treated, :string
  end
end
