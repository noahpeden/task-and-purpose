# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


john = User.create!(
  email: "john.doe@example.com",
  first_name: "John",
  last_name: "Doe",
  team_leader: false
)

jane = User.create!(
  email: "jane.doe@example.com",
  first_name: "Jane",
  last_name: "Doe",
  team_leader: true
)

joe = User.create!(
  email: "joe.doe@example.com",
  first_name: "Joe",
  last_name: "Doe",
  team_leader: false
)

Task.create!(
  [
    {
      name: "Martian Chronicles",
      complete: false,
      user: john,
      duedate: Date.today.next_day
    },
    {
      name: "The Martian",
      complete: false,
      user: joe,
      duedate: Faker::Date.between(from: 2.days.ago, to: 1.year.from_now)
    },
    {
      name: "Doom",
      complete: false,
      user: jane,
      duedate: Faker::Date.between(from: 2.days.ago, to: Date.today),
    },
    {
      name: "Mars Attacks!",
      complete: true,
      user: joe,
      duedate: Faker::Date.between(from: 2.days.ago, to: 1.year.from_now)
    }
  ]
)
