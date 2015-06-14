class CreateSoups < ActiveRecord::Migration
  def change
    create_table :soups do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.string :recipe_url

      t.timestamps null: false
    end
  end
end
