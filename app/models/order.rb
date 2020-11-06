class Order < ApplicationRecord
  belongs_to :user
  belongs_to :drink

  validates :drink_id, :user_id, :quantity, presence: true

end
