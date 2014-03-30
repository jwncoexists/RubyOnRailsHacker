class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, confirmation: true, 
            length: { minimum: 6 }, unless: :already_has_password?
  validates :email, presence: true, uniqueness: true
  before_create { generate_token(:token) }
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
