class Comment < ApplicationRecord
  resourcify
  belongs_to :commentable, polymorphic: true
  belongs_to :user, inverse_of: :comments

  validates :comment, presence: true
end
