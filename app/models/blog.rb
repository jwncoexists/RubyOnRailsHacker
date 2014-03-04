class Blog < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :user, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  default_scope order('updated_at DESC') 
end

