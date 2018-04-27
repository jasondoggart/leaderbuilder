class Role < ApplicationRecord
  belongs_to :ministry
  belongs_to :team_member, class_name: 'User'

  has_many :leading_relationships,
           class_name: 'RoleRelationship',
           foreign_key: 'leading_role_id'
  has_many :following_relationships,
           class_name: 'RoleRelationship',
           foreign_key: 'following_role_id'
  has_many :leaders, through: :following_relationships, source: :leading_role
  has_many :followers, through: :leading_relationships, source: :following_role
  has_many :apprentice_relationships
  has_many :apprentices, through: :apprentice_relationships, foreign_key: 'apprentice_id'
  validates_presence_of :ministry,
                        :team_member,
                        :role_type,
                        :name

  def role_details
    team_member.full_name + ' - ' + name
  end

end
