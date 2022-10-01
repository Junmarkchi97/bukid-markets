class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end
