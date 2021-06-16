class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :rating, :boolean
  end
end
