class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :town
      t.string :city
      t.string :tehsil
      t.string :district
      t.string :state
      t.integer :pin

      t.timestamps
    end
  end
end
