#Create Users
10.times do
  User.create!(
  name:     Faker::GameOfThrones.character,
  email:    Faker::Internet.email,
  password: Faker::Internet.password
  )
end

users = User.all

#Create Wikis
50.times do
  wiki = Wiki.create!(
    user:     users.sample,
    title:    Faker::DrWho.quote,
    body:     Faker::Lorem.paragraph,
    private:  false
  )
end

wikis = Wiki.all


puts "Seed Finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
