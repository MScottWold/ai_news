# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  admin           :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  attr_reader :password
  
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :password, 
    length: { minimum: 8, allow_nil: true }, 
    format: { 
      with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*-])(?=.*[0-9]).{8,}\z/,
      message: "password must contain at least: one lowercase letter, one uppercase letter, & one special character (!@#$%^&*-)",
      allow_nil: true
    }
  validates :admin, inclusion: [true, false]

  before_validation :ensure_session_token

  has_many :favorites,
    class_name: :Favorite,
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy

  has_many :favorite_articles,
    through: :favorites,
    source: :article

  has_many :comments,
    class_name: :Comment,
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    return user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  # private

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
