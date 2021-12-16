class Article < ApplicationRecord
  has_rich_text :text
  validates_presence_of :title
end
