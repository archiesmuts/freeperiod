# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Grade.destroy_all
Subject.destroy_all

Grade.create([
  {name: "Grade 1", slug: "grade-1"},
  {name: "Grade 2", slug: "grade-2"},
  {name: "Grade 3", slug: "grade-3"},
  {name: "Grade 4", slug: "grade-4"},
  {name: "Grade 5", slug: "grade-5"},
  {name: "Grade 6", slug: "grade-6"},
  {name: "Grade 7", slug: "grade-7"},
  {name: "Grade 8", slug: "grade-8"},
  {name: "Grade 9", slug: "grade-9"},
  {name: "Grade 10", slug: "grade-10"},
  {name: "Grade 11", slug: "grade-11"},
  {name: "Grade 12", slug: "grade-12"}
])

20.times do
  Subject.create do |subject|
    subject.name = Faker::Educator.course
    subject.slug = Faker::Internet.slug
  end
end
