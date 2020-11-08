class Property < ActiveRecord::Base
  belongs_to :user
  has_many :images
  validates :str_address, presence: true, length: {minimum: 5}
  validates_numericality_of :price, greater_than: 0
end