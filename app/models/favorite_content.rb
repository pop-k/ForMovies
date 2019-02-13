class FavoriteContent < ApplicationRecord


#動画お気に入り
	belongs_to :content, optional: true
	belongs_to :user, optional: true
end
