class AddPatientIdToConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :patient_id, :integer
  end
end
