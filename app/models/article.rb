class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_rich_text :content
  validates_presence_of :title
end
