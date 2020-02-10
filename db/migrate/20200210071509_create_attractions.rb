class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attactions do |t|
      t.string :name
      t.string :location
      t.string :comments
      t.boolean :visited
      t.integer :user_id
    end
  end
end
