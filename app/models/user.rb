class User < ApplicationRecord
  include Clearance::User
  validates_presence_of :first_name, :last_name
end
