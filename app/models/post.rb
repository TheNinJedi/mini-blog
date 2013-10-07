class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments, dependent: :destroy
  attr_accessible :body, :published_at, :title, :author_id

  #presence
  validates :author, :title, :body, presence: true
  #length
  validates :body, :title, length: { minimum: 2 }
end
