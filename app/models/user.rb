class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, confirmation: true,
            length: { minimum: 6 }, unless: :already_has_password?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  before_create { generate_token(:token) }
  before_save { |user| user.email = user.email.downcase }
  has_many :blogs
  has_many :comments
  mount_uploader :avatar, AvatarUploader

  ACCOUNTS = %w[member admin]
  def account?(base_account)
    account.nil? ? false : ACCOUNTS.index(base_account.to_s) <= ACCOUNTS.index(account)
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.hex(6)
    end while User.exists?(column => self[column])
  end

  private

    def already_has_password?
      !self.password_digest.blank?
    end

end
