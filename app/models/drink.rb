class Drink < ApplicationRecord
    belongs_to :orders
    has_many :users, through: :orders
  
    validates :name, :ingredients, :price, presence: true
    
    
end


#user has many orders. orders have many drinks. drinks have many ingredients
#many-to-many relationship implemented with has_many :through associations.

#orders has_many ingredients through:drinks