class Comment < ApplicationRecord
  belongs_to :user

  belongs_to :parent, class_name: "Comment", optional: true
  has_many :answers, foreign_key: "parent_id", class_name: "Comment"

  default_scope { order(created_at: :desc) }

  validates :body, presence: true
  validates_length_of :body, maximum: 140
end
