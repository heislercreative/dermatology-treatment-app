class AddProviderIdToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :provider_id, :integer
  end
end
