class Photo < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fill: [360, 270, { crop: :centre }]
    attachable.variant :large, resize_to_fill: [1026, 760, { crop: :centre }]
  end

  belongs_to :article

  delegate :attached?, to: :image, prefix: true
end
