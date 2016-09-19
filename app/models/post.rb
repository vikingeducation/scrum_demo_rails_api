class Post < ApplicationRecord
  has_many :comments

  validates :title, length: { maximum: 10 }
  validates :body, length: { maximum: 10 }
end
