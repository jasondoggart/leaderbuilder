# Create users

User.create(
  first_name: 'Jason',
  last_name: 'Doggart',
  email: 'jasondoggart@gmail.com',
  password: 'password'
)

User.create(
  first_name: 'Kevin',
  last_name: 'Shepherd',
  email: 'kshepherd@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Jeremy',
  last_name: 'Bates',
  email: 'jbates@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Kelvin',
  last_name: 'Honsinger',
  email: 'khonsinger@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Jenni',
  last_name: 'Colwell',
  email: 'jcolwell@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Cheryl',
  last_name: 'Neal',
  email: 'cneal@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Rick',
  last_name: 'Zuidersma',
  email: 'rzuidersma@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Holly',
  last_name: 'Bates',
  email: 'hbates@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Salem',
  last_name: 'Faraj',
  email: 'sfaraj@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Steve',
  last_name: 'Swartwood',
  email: 'sswartwood@gtburlington.org',
  password: 'password'
)

User.create(
  first_name: 'Isaias',
  last_name: 'Zarazua',
  email: 'izarazua@gtburlington.org',
  password: 'password'
)

500.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = first_name.downcase + last_name.downcase + '@example.com'
  password = 'password'
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password
  )
end

puts "Create #{User.count} Users"


# Create ministries

Ministry.create(
  name: 'Lift Kids',
  director: User.find_by(email: 'jcolwell@gtburlington.org')
)

Ministry.create(
  name: 'Family Life',
  director: User.find_by(email: 'cneal@gtburlington.org')
)

Ministry.create(
  name: 'Fuse Youth',
  director: User.find_by(email: 'rzuidersma@gtburlington.org')
)

Ministry.create(
  name: 'Flipside Jr. High',
  director: User.find_by(email: 'hbates@gtburlington.org')
)

Ministry.create(
  name: 'Seniors',
  director: User.find_by(email: 'sfaraj@gtburlington.org')
)

Ministry.create(
  name: 'First Impressions',
  director: User.find_by(email: 'sfaraj@gtburlington.org')
)

Ministry.create(
  name: 'Community Life',
  director: User.find_by(email: 'sswartwood@gtburlington.org')
)

Ministry.create(
  name: 'Worship Arts',
  director: User.find_by(email: 'izarazua@gtburlington.org')
)

# Create roles

Ministry.all.each do |ministry|
  # Create 30 ministry leaders
  30.times do
    ministry.roles.create(
      name: "#{ministry.name} leader",
      role_type: "Ministry Leader",
      team_member: User.find(rand(1..User.count))
    )
  end

  # Create 6 coaches
  6.times do
    ministry.roles.create(
      name: "#{ministry.name} coach",
      role_type: "Coach",
      team_member: User.find(rand(1..User.count))
    )
  end
end
