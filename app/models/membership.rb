class Membership < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :school

  # validates_uniqueness_of :user_id, scope: :school_id, message: "membership already exists"
  # validates :user_id, :school_id, :member, presence: true
  attribute :email, :string
  before_validation :set_school_id, if: :email?

  def set_school_id
    self.user = User.invite!(email: email, slug: "first_name-last_name")
  end
  # perhaps add management
  enum member: {
    staff: 0,
    student: 1,
    parent_of: 2
  }

  # enum permission:  {
  #   readonly: 0,
  #   admin: 1,
  #   management: 2
  # }

  def school_name
   school.try(:name)
  end

  def school_name=(name)
    self.school = School.where(name: name).take if name.present?
  end

  def user_name
    user.try(:slug)
  end
  def user_name=(slug)
    self.user = User.where(slug: slug).take if slug.present?
  end
end
