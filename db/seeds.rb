# Create users

User.create(
  first_name: 'Jason',
  last_name: 'Doggart',
  email: 'jasondoggart@gmail.com',
  password: 'password',
  pc_id: '3150149'
)

puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Kevin',
  last_name: 'Shepherd',
  email: 'kshepherd@gtburlington.org',
  password: 'password',
  pc_id: '3150191'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Jeremy',
  last_name: 'Bates',
  email: 'jbates@gtburlington.org',
  password: 'password',
  pc_id: '5946488'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Kelvin',
  last_name: 'Honsinger',
  email: 'khonsinger@gtburlington.org',
  password: 'password',
  pc_id: '24225333'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Jenni',
  last_name: 'Colwell',
  email: 'jcolwell@gtburlington.org',
  password: 'password',
  pc_id: '9624177'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Cheryl',
  last_name: 'Neal',
  email: 'cneal@gtburlington.org',
  password: 'password',
  pc_id: '9638516'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Rick',
  last_name: 'Zuidersma',
  email: 'rzuidersma@gtburlington.org',
  password: 'password',
  pc_id: '5608128'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Holly',
  last_name: 'Bates',
  email: 'hbates@gtburlington.org',
  password: 'password',
  pc_id: '5608146'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Salem',
  last_name: 'Faraj',
  email: 'sfaraj@gtburlington.org',
  password: 'password',
  pc_id: '11389973'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Steve',
  last_name: 'Swartwood',
  email: 'sswartwood@gtburlington.org',
  password: 'password',
  pc_id: '6758408'

)
puts "Added user #{User.last.first_name}"

User.create(
  first_name: 'Isaias',
  last_name: 'Zarazua',
  email: 'izarazua@gtburlington.org',
  password: 'password',
  pc_id: '26257127'

)
puts "Added user #{User.last.first_name}"

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


