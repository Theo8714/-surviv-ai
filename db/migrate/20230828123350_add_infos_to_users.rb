class AddInfosToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :company_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
