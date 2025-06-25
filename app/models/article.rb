class Article < ApplicationRecord
  include StringEnum

  SECTIONS = %i(us politics sports business).freeze

  string_enum :section, SECTIONS

  validates :title, presence: true

  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }
  scope :highlighted, -> { where(highlighted: true) }

  belongs_to :author

  has_one :photo, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :readers, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  delegate :image_attached?, to: :photo

  def user_favorite_id(user)
    favorites.where(user_id: user.id).pick(:id)
  end
end
