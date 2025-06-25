class Author < ApplicationRecord
  validates :name, :bio, :education, presence: true

  has_many :articles, dependent: :destroy
end
