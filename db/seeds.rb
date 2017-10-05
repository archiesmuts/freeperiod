# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Grade.destroy_all
# Subject.destroy_all
# Course.destroy_all
# AssessmentType.destroy_all
# AssessmentTask.destroy_all

# Result.destroy_all
# Part.destroy_all
# Assessment.destroy_all
# RegistrationKlass.destroy_all
# UserRegistration.destroy_all
# Membership.destroy_all
# School.destroy_all
# User.destroy_all

# Grade.create([
#   {name: "Grade 1", slug: "grade-1"},
#   {name: "Grade 2", slug: "grade-2"},
#   {name: "Grade 3", slug: "grade-3"},
#   {name: "Grade 4", slug: "grade-4"},
#   {name: "Grade 5", slug: "grade-5"},
#   {name: "Grade 6", slug: "grade-6"},
#   {name: "Grade 7", slug: "grade-7"},
#   {name: "Grade 8", slug: "grade-8"},
#   {name: "Grade 9", slug: "grade-9"},
#   {name: "Grade 10", slug: "grade-10"},
#   {name: "Grade 11", slug: "grade-11"},
#   {name: "Grade 12", slug: "grade-12"}
# ])

# 20.times do
#   Subject.create do |subject|
#     subject.name = Faker::Educator.course
#     subject.slug = Faker::Internet.slug
#   end
# end
#
# AssessmentType.create([
#   {name: "Diagnostic", slug: "diagnostic"},
#   {name: "Formative", slug: "formative"},
#   {name: "Summative", slug: "summative"},
#   {name: "Norm-referenced tests", slug: "norm-referenced-tests"},
#   {name: "Criterion-referenced tests", slug: "criterion-referenced-tests"}
# ])
# formative = AssessmentType.find_by(name: "Formative")
# summative = AssessmentType.find_by(name: "Summative")
#
# AssessmentTask.create([
#   {name: "Test", slug: "test", assessment_type_id: formative.id },
#   {name: "Project", slug: "project", assessment_type_id: formative.id },
#   {name: "Practical Task", slug: "practical-task", assessment_type_id: formative.id },
#   {name: "Investigation", slug: "investigation", assessment_type_id: formative.id },
#   {name: "Final Project", slug: "final-project", assessment_type_id: summative.id },
#   {name: "Examination", slug: "examination", assessment_type_id: summative.id }
#   ])
#
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
# user1 = User.create(
#   first_name: "Archie",
#   last_name: "Smuts",
#   email: "achiesmuts@gmail.com",
#   password: 'archiesmuts',
#   password_confirmation: 'archiesmuts',
#   slug: "archie-smuts",
#   confirmed_at: Faker::Time.between(1.day.ago, Date.today, :all)
#   )


# school = School.create(name: "Hello World", slug: "hello-world")
# school = School.first
# users = school.users
# account_owner = User.find_by(email: "archiesmuts@gmail.com")
# school.users << account_owner
# account_owner.add_role(:account_owner, school)
#
# adding users to existing school.
# school = School.friendly.find("school-of-space-travel")
# Seeding invitable model without sending invitation emails
# def adduser(email, password, first_name, last_name, slug)
#   @user = User.invite!(:email => email, :slug => slug) do |u|
#     u.skip_invitation = true
#   end
#   token = @user.instance_variable_get(:@raw_invitation_token)
#   User.accept_invitation!(:invitation_token => token,
#                           :password => password,
#                           :password_confirmation => password,
#                           :first_name => first_name,
#                           :last_name => last_name,
#                           :slug => slug)
#
#   puts "Created User #{email} with password #{password}"
#   @user
# end
#
#
# 30.times do
#   User.create do
#     user =  adduser(
#         Faker::Internet.safe_email,
#         "password1234",
#         Faker::Name.first_name,
#         Faker::Name.last_name,
#         Faker::Internet.slug
#         )
#       school.users << user
#     end
# end

# school  = School.friendly.find("school-of-space-travel")
# Role.where(name: "account_owner")
# users = User.joins(:roles).where(roles: {name: "account_owner"})
# users.each do |user|
#   user.remove_role("account_owner", school)
# end
 # subjects = Subject.all
 # grade_10 = Grade.friendly.find("grade-10")
 # grade_11 = Grade.friendly.find("grade-11")
 # grade_12 = Grade.friendly.find("grade-12")
 # subjects.each do |subject|
 #   subject.courses.create(name: Faker::Lorem.sentence, grade_id: grade_10.id, subject_type: 0)
 #   puts "Created Course "
 # end

#  subjects.each do |subject|
#    subject.courses.create(name: Faker::Lorem.sentence, grade_id: grade_11.id, subject_type: 0)
#  end
#  subjects.each do |subject|
#   subject.courses.create(name: Faker::Lorem.sentence, grade_id: grade_12.id, subject_type: 0)
# end
# subjects.each do |subject|
#   subject.courses.create(name: Faker::Lorem.sentence, grade_id: grade_10.id, subject_type: 1)
# end
# subjects.each do |subject|
#   subject.courses.create(name: Faker::Lorem.sentence, grade_id: grade_11.id, subject_type: 1)
# end
# subjects.each do |subject|
#   subject.courses.create(name: Faker::Lorem.sentence, grade_id: grade_12.id, subject_type: 1)
# end
