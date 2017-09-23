class Membership < ApplicationRecord
  resourcify
  before_validation :set_school_id, if: :email?
  belongs_to :user
  belongs_to :school

  # validates_uniqueness_of :user_id, scope: :school_id, message: "membership already exists"
  validates :user_id, :school_id, :member, presence: true
  attribute :email, :string
  attribute :slug, :string


  def set_school_id
    self.user = User.invite!(email: email, slug: slug)
  end

  # perhaps add management
  enum member: {
    not_defined: 0,
    account_owner: 1,
    educator: 2,
    learner: 3,
    parent_or_guardian: 4,
    general: 5
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
    self.school = School.create(name: name)
  end

  def user_name
    user.try(:slug)
  end
  def user_name=(slug)
    self.user = User.where(slug: slug).take if slug.present?
  end
end
