class AddSellerToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :seller, :boolean, default: false, null: false
    add_column :users, :bio, :text
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :avatar, :string
  end
end
