class AddVariablesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :city, :string
    add_column :users, :phone_number, :string
    add_column :users, :about, :text
    add_column :users, :resume, :text
  end
end
