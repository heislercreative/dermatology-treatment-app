class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :date_diagnosed
      t.boolean :treated
      t.string :treatment
    end
  end
end
