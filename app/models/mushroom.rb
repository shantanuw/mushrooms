class Mushroom < ActiveRecord::Base

	attr_accessible :color, :name, :mushroom_type, :poisonous

	validates :color, :presence => true,
					  :length => { :maximum => 50 }
	validates :name, :presence => true,
					 :length => { :maximum => 50 },
					 :uniqueness => { :case_sensitive => false }
	validates :mushroom_type, :presence => true,
					 :length => { :maximum => 50 }

end
