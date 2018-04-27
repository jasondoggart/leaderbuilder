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

  def percent_having_apprentice(role_type)
    total_roles = roles.where(role_type: role_type)
    return 0 if total_roles.count == 0
    i = 0
    total_roles.each do |role|
      if role.apprentices.count > 0
        i += 1
      end
    end
    (i.to_f/total_roles.count.to_f * 100).round(0)
  end
end
