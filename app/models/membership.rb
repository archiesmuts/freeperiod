class Membership < ApplicationRecord
  include ActiveModel::Dirty
  resourcify
  before_validation :set_school_id, if: :email?
  belongs_to :user, inverse_of: :memberships
  belongs_to :school, inverse_of: :memberships

  validates_uniqueness_of :user_id, scope: :school_id, message: "membership already exists."
  validates :user_id, :school_id, :member, presence: true
  attribute :email, :string
  attribute :slug, :string
  # TODO add an option to help filter users for lookup when user registrations are created

  def set_school_id
    self.user = User.invite!(email: email, slug: slug)
  end

  # perhaps add management
  enum member: {
    not_defined: 0,
    educator: 2,
    learner: 3,
    parent_or_guardian: 4,
    friend_of_school: 5,
    school_admin: 6,
    account_owner: 1
  }
  # setup different levels of roles for permisions
  enum basic_role: {
    not_defined: 0,
    learner: 1,
    parent: 2,
    friend: 3,
    staff: 4
  }
  enum staff_role: {
    none: 0,
    educator: 1,
    admin: 2,
    management: 3,
    account_owner: 4
  }
  enum account_role: {
    none: 0,
    admin: 1,
    account_owner: 2
  }
  # enum permission:  {
  #   readonly: 0,
  #   admin: 1,
  #   management: 2
  # }
  def school_short_name
    school_name.truncate(35)
  end

  def school_name
   school.try(:name)
  end

  def school_name=(name)
    self.school = School.find_or_create_by(name: name)
  end

  def user_name
    user.try(:slug)
  end
  def user_name=(slug)
    self.user = User.where(slug: slug).take if slug.present?
  end
  # TODO add date started when user first enrolled
  # TODO add date completed if user leaves school
end
