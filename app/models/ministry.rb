class Ministry < ApplicationRecord
  validates_presence_of :name, :director
  belongs_to :director, class_name: 'User'
  has_many :roles

  def number_of_coaches
    roles.where(role_type: 'Coach').count
  end

  def number_of_leaders
    roles.where(role_type: 'Team Leader').count
  end

  def number_of_members
    roles.where(role_type: 'Team Member').count
  end
end
