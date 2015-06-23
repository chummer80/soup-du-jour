class CreateMorsels < ActiveRecord::Migration
  def change
    create_table :morsels do |t|
      t.string :morsel_type
      t.string :zip_code, default: ""
      t.text :data

      t.timestamps null: false
    end
  end
end
