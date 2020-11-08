class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :price
      t.string :str_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :user_id
    end
  end
end
