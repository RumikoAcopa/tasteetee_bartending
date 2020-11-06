class Drink < ApplicationRecord
    validates :name, :ingredients, :price, presence: true

end
