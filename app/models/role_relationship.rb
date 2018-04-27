class RoleRelationship < ApplicationRecord
  belongs_to :leading_role, class_name: 'Role'
  belongs_to :following_role, class_name: 'Role'
end
