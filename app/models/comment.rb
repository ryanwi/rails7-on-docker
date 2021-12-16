class Comment < ApplicationRecord
  belongs_to :article
  broadcasts_to :article
end
