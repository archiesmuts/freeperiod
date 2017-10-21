class Comment < ApplicationRecord
  resourcify
  belongs_to :commentable, polymorphic: true

  validates :comment, presence: true
end
