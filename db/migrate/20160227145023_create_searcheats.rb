class CreateSearcheats < ActiveRecord::Migration
  def change
    create_table :searcheats do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.string :people
      t.string :kind

      t.timestamps null: false
    end
  end
end
