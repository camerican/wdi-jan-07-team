# randomizer.rb

# We'll try to randomly assign roles to each of us

people = `sqlite3 wdi "SELECT * FROM person"`.split("\n").map do |person|
  person.split('|')
end

roles = `sqlite3 wdi "SELECT * FROM role"`.split("\n").map do |role|
  role.split('|')
end

people.length.times do |i|
  # find and remove person from our person array
  person = people.delete_at(rand(people.length))
  # find and remove role from roles array
  role = roles.delete_at(rand(roles.length))
  `sqlite3 wdi "UPDATE person SET role_id = '#{role[0]}' WHERE id = '#{person[0]}'"`
  p "#{person[1]} has been assigned the #{role[1]} #{role[2]}"
  sleep(3)
end