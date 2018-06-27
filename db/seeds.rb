# freeperiod database seeding

# Clean up the database before seeding
  Grade.destroy_all
  Subject.destroy_all
  Course.destroy_all
  # Event.destroy_all
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

# create all grades
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
    {name: "All Grades", slug: "all-grades"}
  ])

# setup subject list from DOE website
# is this the same as the independents schools?
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

# create subject list from subject_list array above
  subject_list.each do |subject|
    Subject.create( :name => subject[0], :slug => subject[1] )
  end

# create courses from the grade point of view
# first setup Registration Classes
  Course.destroy_all
  grades = Grade.all
  grades.each do |grade, subjects|
    subjects = Subject.where(name: "Registration")
    subjects.each do |subject|
      grade.courses.create(name: "#{grade.name} Registration", grade_id: grade.id, subject_id: subject.id, subject_type: 1)
    end
  end

# secondly setup courses for higher grades 8 to 12
  higher_grades = Grade.offset(7).limit(6)
  higher_grades.each do |grade, subjects|
    subjects = Subject.where.not(name: "Registration")
    subjects.each do |subject|
      grade.courses.create(name: "#{grade.name} #{subject.name}", grade_id: grade.id, subject_id: subject.id, subject_type: 1)
    end
  end

# setup assessment types
  AssessmentType.create([
    {name: "Diagnostic",
      description: "Lorem Ipsum is simply dummy text of the
      printing and typesetting industry. Lorem Ipsum has been the industry's
      standard dummy text ever since the 1500s, when an unknown printer took
      a galley of type and scrambled it to make a type specimen book.",
      slug: "diagnostic"},
    {name: "Formative", description: "Lorem Ipsum is simply dummy text of the
      printing and typesetting industry. Lorem Ipsum has been the industry's
      standard dummy text ever since the 1500s, when an unknown printer took
      a galley of type and scrambled it to make a type specimen book.",
      slug: "formative"},
    {name: "Summative", description: "Lorem Ipsum is simply dummy text of the
      printing and typesetting industry. Lorem Ipsum has been the industry's
      standard dummy text ever since the 1500s, when an unknown printer took
      a galley of type and scrambled it to make a type specimen book.",
      slug: "summative"},
    {name: "Norm-referenced tests", description: "Lorem Ipsum is simply dummy
      text of the printing and typesetting industry. Lorem Ipsum has been
      the industry's standard dummy text ever since the 1500s, when an unknown
      printer took a galley of type and scrambled it to make a type
      specimen book.",
      slug: "norm-referenced-tests"},
      {name: "Criterion-referenced tests", description: "Lorem Ipsum is simply dummy
        text of the printing and typesetting industry. Lorem Ipsum has been
        the industry's standard dummy text ever since the 1500s, when an unknown
        printer took a galley of type and scrambled it to make a type
        specimen book.",
        slug: "criterion-referenced-tests"}
  ])
  formative = AssessmentType.find_by(name: "Formative")
  summative = AssessmentType.find_by(name: "Summative")

# setup assessment tasks
  AssessmentTask.create([
    {name: "Test", slug: "test", assessment_type_id: formative.id },
    {name: "Project", slug: "project", assessment_type_id: formative.id },
    {name: "Practical Task", slug: "practical-task", assessment_type_id: formative.id },
    {name: "Investigation", slug: "investigation", assessment_type_id: formative.id },
    {name: "Final Project", slug: "final-project", assessment_type_id: summative.id },
    {name: "Examination", slug: "examination", assessment_type_id: summative.id }
    ])

# adding users, schools and memberships
  # Membership.destroy_all
  # User.destroy_all
  # School.destroy_all

# setup first user as account_owner for first school
  archie = User.create(
    first_name: "Archie",
    last_name: "Smuts",
    email: "archiesmuts@gmail.com",
    password: 'archiesmuts',
    password_confirmation: 'archiesmuts',
    slug: "smuts-archie",
    confirmed_at: Faker::Time.between(5.days.ago, Date.today, :all)
  )

# setup first user as account_owner for second school
  harry = User.create(
    first_name: "Harry",
    last_name: "Potter",
    email: "harrypotter@gmail.com",
    password: 'harrypotter',
    password_confirmation: 'harrypotter',
    slug: "potter-harry",
    confirmed_at: Faker::Time.between(3.days.ago, Date.today, :all)
  )

# first school
  programmers_school = School.create(name: "Hello World School for Programmers", slug: "hello-world-school-for-programmers")
  # programmers_school.save!
  programmers_school.memberships.create(user: archie, primary_role: 1, slug: "smuts-archie")
  archie.add_role(:account_owner, programmers_school)

# second school
  wizards_school = School.create(name: "Hogwarts School for Wizards", slug: "hogwarts-school-for-wizards")
  # wizards_school.save!
  wizards_school.memberships.create(user: harry, primary_role: 1, slug: "potter-harry")
  harry.add_role(:account_owner, wizards_school)

# define method to send invitaion to users for each of the schools respectively
# without sending emails
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

  programmers = programmers_school.users
  wizards = wizards_school.users

# adding 30 learners to school - p = programmer, l = learner
  30.times do
    User.create do
      user =  adduser(
        Faker::Internet.safe_email,
        "password1234",
        "#{Faker::Name.first_name}-pl",
        Faker::Name.last_name,
        "#{Faker::Name.first_name}-pl-#{Faker::Name.last_name.downcase}".downcase
      )
      programmers << user
    end
  end

# adding 10 teachers to hello world school - p = programmer, t = teacher
  10.times do
    User.create do
      user =  adduser(
        Faker::Internet.safe_email,
        "password1234",
        "#{Faker::Name.first_name}-pt",
        Faker::Name.last_name,
        "#{Faker::Name.first_name.downcase}-pt-#{Faker::Name.last_name.downcase}".downcase
      )
      programmers << user
    end
  end

# adding 10 teachers to wizards_school w = wizards, t = teacher
  10.times do
    User.create do
      user =  adduser(
        Faker::Internet.safe_email,
        "password1234",
        "#{Faker::Name.first_name}-wt",
        Faker::Name.last_name,
        "#{Faker::Name.first_name}-wt-#{Faker::Name.last_name}".downcase
      )
      wizards << user
    end
  end

# add 30 learners to wizards_school w = wizards, l = learner
  30.times do
    User.create do
      user =  adduser(
        Faker::Internet.safe_email,
        "password1234",
        "#{Faker::Name.first_name}-wl",
        Faker::Name.last_name,
        "#{Faker::Name.first_name}-wl-#{Faker::Name.last_name}".downcase
      )
      wizards << user
    end
  end
