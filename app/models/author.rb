class Author < ActiveRecord::Base
  has_secure_password 

  has_many :posts
  has_many :comments, through: :posts
  attr_accessible :bio, :email, :first_name, :last_name, :twitter, :username, :password, :password_confirmation
  
  #VALIDATIONS
  # presence
  validates :email, :first_name, :last_name, :username, presence: true
  # uniqueness
  validates :email, :username, :twitter, uniqueness: true, allow_blank: true
  # length
  validates :bio, length: { in: 30..500 }

  # another way to do it all at once.
  #validates :email, presence: true,
   #                 format:,
    #                 length:,
    #                uniqueness:

  def full_name
    (first_name + ' ' + last_name).titleize
    # another way to do this vv
    # (first_name, last_name).join(' ')
  end

  def twitter_link
    "http://twitter.com"
  end

end


