# == Schema Information
#
# Table name: photos
#
#  id                :bigint           not null, primary key
#  alt_text          :string           not null
#  title             :string           not null
#  source_url        :string           not null
#  photographer_name :string           not null
#  photographer_url  :string           not null
#  license_type      :string           not null
#  license_url       :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Photo < ApplicationRecord
  validates(
    :alt_text,
    :title,
    :photographer_name,
    :photographer_url,
    :license_type,
    :license_url,
    presence: true,
  )

  has_one_attached :thumbnail
  has_one_attached :image

  has_many :articles, dependent: :nullify
end
