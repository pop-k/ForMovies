class Comment < ApplicationRecord

	belongs_to :user, optional: true, inverse_of: :comments
	belongs_to :content, optional: true, inverse_of: :comments
end
