class User < ApplicationRecord
  include Clearance::User
  validates_presence_of :first_name, :last_name, :pc_id
  has_many :ministries,
           class_name: 'Ministry',
           foreign_key: 'director_id'
  has_many :roles,
           class_name: 'Role',
           foreign_key: 'team_member_id'
  has_many :apprentice_relationships, foreign_key: 'apprentice_id'

  default_scope { order( created_at: :desc) }

  def full_name
    first_name + ' ' + last_name
  end

  def number_of_roles
    roles.count
  end


end
