class User < ApplicationRecord
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates(
    :password,
    length: { minimum: 8, allow_nil: true },
    format: {
      with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*-])(?=.*[0-9]).{8,}\z/,
      message: I18n.t("models.user.errors.password.format"),
      allow_nil: true,
    },
  )
  validates :admin, inclusion: [true, false]

  before_validation :ensure_session_token

  has_many :favorites, dependent: :destroy
  has_many(
    :favorite_articles,
    through: :favorites,
    source: :article,
  )
  has_many :comments, dependent: :destroy

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    return nil unless user

    user.is_password?(password) ? user : nil
  end

  def reset_oauth_token!
    update(oauth_token: nil)
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
    save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
end
