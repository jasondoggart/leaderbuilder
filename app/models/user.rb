class User < ApplicationRecord
  include Clearance::User
  validates_presence_of :first_name, :last_name
  has_many :ministries,
    class_name: "Ministry",
    foreign_key: 'director_id'

  def full_name
    first_name + ' ' + last_name
  end
end
