class Ministry < ApplicationRecord
  validates_presence_of :name, :director
  belongs_to :director, class_name: 'User'
  has_many :roles
end
