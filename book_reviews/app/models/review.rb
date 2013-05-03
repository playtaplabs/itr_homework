class Review < ActiveRecord::Base
  attr_accessible :book_id, :content, :user_id

  belongs_to :book
end
