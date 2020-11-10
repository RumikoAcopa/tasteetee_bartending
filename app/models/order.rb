class Order < ApplicationRecord
  belongs_to :user

  validates :drink_id, :user_id, :quantity, presence: true

  def drink_name
    self.try(:drink).try(:name)
  end

  def drink_name=(name)
    drink = Drink.find_or_create_by(name: name)
    self.drink = drink
  end
end
