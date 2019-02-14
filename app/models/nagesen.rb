class Nagesen < ApplicationRecord

# ユーザーとの紐づけ
	belongs_to :user, optional: true, inverse_of: :nagesens

# コンテンツとの紐づけ
	belongs_to :content, optional: true, inverse_of: :nagesens
end
