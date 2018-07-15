class Membership < ApplicationRecord
  include ActiveModel::Dirty
  resourcify
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  before_validation :set_school_id, if: :email?
  belongs_to :user, inverse_of: :memberships
  belongs_to :school, inverse_of: :memberships

  validates_uniqueness_of :user_id, scope: :school_id, message: "membership already exists."
  validates :user_id, :school_id, :primary_role, :details, presence: true
  attribute :email, :string
  attribute :slug, :string

  # TODO add an option to help filter users for lookup when user registrations are created

  def set_school_id
    self.user = User.invite!(email: email, slug: slug)
  end

  enum primary_role: {
    not_defined: 0,
    educator: 1,
    staff: 5,
    learner: 2,
    parent_or_guardian: 3,
    friend_of_school: 4,
    account_owner: 6
  }

  jsonb_accessor :details,
    date_enrolled: :datetime,
    date_completed: :datetime,
    current_grades: :string,
    other_roles: :string

    # search_tags: [:string, array: true, default: []] #useful when having to add user to classes etc.

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

  def slug_candidates
    [
      [:user_name ],
      [:user_name, :school_short_name],
    ]
  end

  # def should_generate_new_friendly_id?
  #   user_id_changed?
  # end
end
# TODO move assignment of roles from contoller to model
