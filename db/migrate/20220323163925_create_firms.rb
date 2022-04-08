class CreateFirms < ActiveRecord::Migration[5.2]
  def change
    create_table :firms do |t|
      t.string :name
      t.integer :rating
      t.string :address
      t.string :phone_number
      t.string :email
      t.belongs_to :departement, index: true

      t.timestamps
    end
  end
end
