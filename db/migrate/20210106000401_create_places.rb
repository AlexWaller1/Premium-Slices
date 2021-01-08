class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.string :address
      t.text :description
      t.string :image
      t.integer :user_id
    end
  end
end
