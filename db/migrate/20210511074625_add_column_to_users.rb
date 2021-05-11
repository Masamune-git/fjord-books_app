class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postcode, :integer
    add_column :users, :address_city, :string
    add_column :users, :self_introduction, :string
  end
end
