class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie_id, :list_id, presence: true
  validates :movie, uniqueness: { scope: :list }
  validates :comment, presence: true, length: { minimum: 6 }
end
