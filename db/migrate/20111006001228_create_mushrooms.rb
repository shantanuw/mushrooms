class CreateMushrooms < ActiveRecord::Migration
  def change
	drop_table :mushrooms
    create_table :mushrooms do |t|
      t.string :color
      t.string :name
      t.string :mushroom_type
      t.boolean :poisonous

      t.timestamps
    end
  end
  
   def self.down
    drop_table :mushrooms
  end
end
