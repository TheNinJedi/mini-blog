class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :commenter_name, :message, :post_id

  #presence
  validates :commenter_name, :message, :post, presence: true
  #length
  validates :message, length: { in: 10..200 }

  # validates with: custom_validator
  #anti spam bot? no repetition? no links? no videos?

  # private
    # def custom_validator
      # if name == Post.find_by_name(name) && title == Post.find_by_title(title)

      # end
    # end
end
