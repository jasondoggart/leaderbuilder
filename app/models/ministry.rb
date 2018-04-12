class Ministry < ApplicationRecord
  validates_presence_of :name, :director
  belongs_to :director, class_name: 'User'
  has_many :roles

  def number_of_coaches
    self.roles.where(role_type: 'Coach').count
  end

  def number_of_leaders
    self.roles.where(role_type: 'Ministry Leader').count
  end
end
