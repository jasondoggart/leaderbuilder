class Role < ApplicationRecord
  belongs_to :ministry
  belongs_to :team_member, class_name: 'User'
  validates_presence_of :ministry,
                        :team_member,
                        :role_type,
                        :name
end