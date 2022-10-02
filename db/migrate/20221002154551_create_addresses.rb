class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :street
      t.string :barangay
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end
