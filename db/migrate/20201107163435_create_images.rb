class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :property_id
      t.string :image_url
    end
  end
end
