class Property < ActiveRecord::Base
  belongs_to :user
  has_many :images
  validates :str_address, presence: true, length: {minimum: 5}
  validates_numericality_of :price, greater_than: 0

  # build class method called top_5_properties_by_city, method takes one argument the  city and returns the 5 properties with highest price; display in disc order, from most expensive to least expensive

  def self.top_5_properties_by_city(city)
    Property.where(city: city).order(price: :desc).limit(5)
  end

end