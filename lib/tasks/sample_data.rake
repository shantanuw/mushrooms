namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    10.times do |n|
      name  = "White Mushroom #{n+1}"
	  color = "White"
      type = "Wood"
      poison  = false
      Mushroom.create!(:name => name,
                   :color => color,
                   :mushroom_type => type,
                   :poisonous => poison)
    end
	
	10.times do |n|
      name  = "Green Mushroom #{n+1}"
	  color = "Green"
      type = "Grass"
      poison  = true
      Mushroom.create!(:name => name,
                   :color => color,
                   :mushroom_type => type,
                   :poisonous => poison)
    end
	
	10.times do |n|
      name  = "Blue Mushroom #{n+1}"
	  color = "Blue"
      type = "Water"
      poison  = false
      Mushroom.create!(:name => name,
                   :color => color,
                   :mushroom_type => type,
                   :poisonous => poison)
    end
	
	10.times do |n|
      name  = "Black Mushroom #{n+1}"
	  color = "Black"
      type = "Mud"
      poison  = true
      Mushroom.create!(:name => name,
                   :color => color,
                   :mushroom_type => type,
                   :poisonous => poison)
    end
  end
end