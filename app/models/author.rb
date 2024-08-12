# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  bio        :string           not null
#  education  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  validates :name, :bio, :education, presence: true

  has_many :articles, dependent: :destroy
end
