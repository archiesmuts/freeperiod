class Comment < ApplicationRecord
  resourcify
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  validates :comment, presence: true
end
