# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Grade.destroy_all
Subject.destroy_all
Course.destroy_all
Event.destroy_all
Membership.destroy_all
School.destroy_all
User.destroy_all
AssessmentType.destroy_all
AssessmentTask.destroy_all

# Result.destroy_all
# Part.destroy_all
# Assessment.destroy_all
# RegistrationKlass.destroy_all
# UserRegistration.destroy_all

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
  {name: "Grade 12", slug: "grade-12"},
  {name: "Faculty", slug: "faculty"}
])

subject_list = [
  ["Afrikaans", "afrikaans"],
  ["English", "english"],
  ["French", "french"],
  ["German", "german"],
  ["IsiNdebele", "isindebele"],
  ["IsiXhosa", "isixhosa"],
  ["IsiZulu", "isizulu"],
  ["Mandarin", "mandarin"],
  ["Sepedi", "sepedi"],
  ["Serbian", "serbian"],
  ["Sesotho", "sesotho"],
  ["Setswana", "setswana"],
  ["Siswati", "siswati"],
  ["Tshivenda", "tshivenda"],
  ["Xitsonga", "xitsonga"],
  ["Accounting", "accounting"],
  ["Agricultural Management Practices", "agricultural-management-practices"],
  ["Agricultural Science", "agricultural-science"],
  ["Agricultural Technology", "agricultural-technology"],
  ["Business Studies", "business-studies"],
  ["Civil Technology", "civil-technology"],
  ["Computer Applications Technology", "computer-applications-technology"],
  ["Consumer Studies", "consumer-studies"],
  ["Dance Studies", "dance-studies"],
  ["Design Studies", "design-studies"],
  ["Dramatic Arts", "dramatic-arts"],
  ["Economics", "economics"],
  ["Electrical Technology", "electrical-technology"],
  ["Engineering Graphics and Design", "engineering-graphics-and-design"],
  ["Geography", "geography"],
  ["History", "history"],
  ["Hospitality Studies", "hospitality-studies"],
  ["Information Technology", "information-technology"],
  ["Life Orientation", "life-orientation"],
  ["Life Sciences", "life-sciences"],
  ["Mathematical Literacy", "mathematical-literacy"],
  ["Mathematics", "mathematics"],
  ["Mechanical Technology", "mechanical-technology"],
  ["Music", "music"],
  ["Physical Sciences", "physical-sciences"],
  ["Religion Studies", "religion-studies"],
  ["Registration", "registration"],
  ["Technical Mathematics", "technical-mathematics"],
  ["Technical Sciences", "technical-sciences"],
  ["Technical Civil Technology", "technical-civil-technology"],
  ["Technical Electrical Technology", "technical-electrical-technology"],
  ["Technical Mechanical Technology", "technical-mechanical-technology"],
  ["Tourism", "tourism"],
  ["Visual Arts", "visual-arts"]
]

subject_list.each do |subject|
  Subject.create( :name => subject[0], :slug => subject[1] )
end

grade_10 = Grade.friendly.find("grade-10")
grade_11 = Grade.friendly.find("grade-11")
grade_12 = Grade.friendly.find("grade-12")

subjects = Subject.where.not(name: "Registration")
registration_subjects = Subject.where(name: "Registration")
#create registration classes
registration_subjects.each do |subject|
  subject.courses.create(name: "Grade 10 Registration", grade_id: grade_10.id, subject_type: 1)
  puts "Created Grade 10 registration course"
end
registration_subjects.each do |subject|
  subject.courses.create(name: "Grade 11 Registration", grade_id: grade_11.id, subject_type: 1)
  puts "Created Grade 11 registratio course"
end
registration_subjects.each do |subject|
  subject.courses.create(name: "Grade 12 Registration", grade_id: grade_12.id, subject_type: 1)
  puts "Created Grade 12 registration course"
end

#create subject classes
subjects.each do |subject|
  subject.courses.create(name: "Grade 10 #{subject.name}", grade_id: grade_10.id, subject_type: 0)
  puts "Created Grade 10 Subject course"
end

subjects.each do |subject|
  subject.courses.create(name: "Grade 11 #{subject.name}", grade_id: grade_11.id, subject_type: 0)
  puts "Created Grade 11 subject course"
end

subjects.each do |subject|
  subject.courses.create(name: "Grade 12 #{subject.name}", grade_id: grade_12.id, subject_type: 0)
  puts "Created Grade 12 subject course"
end


AssessmentType.create([
  {name: "Diagnostic", slug: "diagnostic"},
  {name: "Formative", slug: "formative"},
  {name: "Summative", slug: "summative"},
  {name: "Norm-referenced tests", slug: "norm-referenced-tests"},
  {name: "Criterion-referenced tests", slug: "criterion-referenced-tests"}
])
formative = AssessmentType.find_by(name: "Formative")
summative = AssessmentType.find_by(name: "Summative")

AssessmentTask.create([
  {name: "Test", slug: "test", assessment_type_id: formative.id },
  {name: "Project", slug: "project", assessment_type_id: formative.id },
  {name: "Practical Task", slug: "practical-task", assessment_type_id: formative.id },
  {name: "Investigation", slug: "investigation", assessment_type_id: formative.id },
  {name: "Final Project", slug: "final-project", assessment_type_id: summative.id },
  {name: "Examination", slug: "examination", assessment_type_id: summative.id }
  ])

# 10.times do
#   User.create do |test_user|
#     test_user.first_name = Faker::Name.first_name
#     test_user.last_name = Faker::Name.last_name
#     test_user.email = Faker::Internet.safe_email
#     test_user.password = 'password1234'
#     test_user.password_confirmation = 'password1234'
#     test_user.slug = "#{test_user.first_name.downcase}-#{test_user.last_name.downcase}"
#     test_user.confirmed_at = Faker::Time.between(1.day.ago, Date.today, :all)
#   end
# end
#
user_one = User.create(
  first_name: "Archie",
  last_name: "Smuts",
  email: "archiesmuts@gmail.com",
  password: 'archiesmuts',
  password_confirmation: 'archiesmuts',
  slug: "archie-smuts",
  confirmed_at: Faker::Time.between(1.day.ago, Date.today, :all)
  )
  user_two = User.create(
    first_name: "Harry",
    last_name: "Potter",
    email: "harrypotter@gmail.com",
    password: 'harrypotter',
    password_confirmation: 'harrypotter',
    slug: "harry-potter",
    confirmed_at: Faker::Time.between(1.day.ago, Date.today, :all)
    )

school_one = School.create(name: "Hello World School for Programmers", slug: "hello-world-school-for-programmers")
school_one.memberships.create(user: user_one, member: 1)
user_one.add_role(:account_owner, school_one)

school_two = School.create(name: "Hogwarts School for Wizards", slug: "hogwarts-school-for-wizards")
school_two.memberships.create(user: user_two, member: 1)
user_two.add_role(:account_owner, school_two)

# school = School.first
# users = school.users
# account_owner = User.find_by(email: "archiesmuts@gmail.com")
# school.users << account_owner
# account_owner.add_role(:account_owner, school)
#
# adding users to existing school.
# school = School.friendly.find("school-of-space-travel")
# Seeding invitable model without sending invitation emails
def adduser(email, password, first_name, last_name, slug)
  @user = User.invite!(:email => email, :slug => slug) do |u|
    u.skip_invitation = true
  end
  token = @user.instance_variable_get(:@raw_invitation_token)
  User.accept_invitation!(:invitation_token => token,
                          :password => password,
                          :password_confirmation => password,
                          :first_name => first_name,
                          :last_name => last_name,
                          :slug => slug)

  puts "Created User #{email} with password #{password}"
  @user
end


30.times do
  User.create do
    user =  adduser(
        Faker::Internet.safe_email,
        "password1234",
        "#{Faker::Name.first_name}-programmer",
        Faker::Name.last_name,
        Faker::Internet.slug
        )
      school_one.users << user
    end
end
30.times do
  User.create do
    user =  adduser(
        Faker::Internet.safe_email,
        "password1234",
        "#{Faker::Name.first_name}-wizzard",
        Faker::Name.last_name,
        Faker::Internet.slug
        )
      school_two.users << user
    end
end

# school  = School.friendly.find("school-of-space-travel")
# Role.where(name: "account_owner")
# users = User.joins(:roles).where(roles: {name: "account_owner"})
# users.each do |user|
#   user.remove_role("account_owner", school)
# end
