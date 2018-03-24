class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :username
      t.password :password_digest
    end
  end
end
