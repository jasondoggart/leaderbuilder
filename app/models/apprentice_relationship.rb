class ApprenticeRelationship < ApplicationRecord
  belongs_to :role
  belongs_to :apprentice, class_name: 'User'
end
