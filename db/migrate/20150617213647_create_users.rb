class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :zip_code
      t.string :interests, array: true, default: []
      t.string :morsels, array: true, default: []

      t.timestamps null: false
    end
  end
end
