class Comment < ApplicationRecord
  resourcify
  belongs_to :commentable, polymorphic: true
  belongs_to :user, inverse_of: :comments
  validates :body, presence: true
end
