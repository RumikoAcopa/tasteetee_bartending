class Drink < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders
  
    validates :name, :ingredients, :price, presence: true
    
    
end
