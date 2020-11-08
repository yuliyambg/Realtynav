class Property < ActiveRecord::Base
  belongs_to :user
  has_many :images

  # validates_presence_of :image
end