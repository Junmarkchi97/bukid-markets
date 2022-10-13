class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :street, default: "", null: false
      t.string :barangay, default: "", null: false
      t.string :city, default: "", null: false
      t.string :postal_code, default: "", null: false
      t.string :country, default: "Philippines", null: false
      t.string :phone_number, default: "", null: false

      t.timestamps
    end
  end
end
