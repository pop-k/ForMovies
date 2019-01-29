class Content < ApplicationRecord

	mount_uploader :video, VideoUploader
	validates :title, :video, :presence => true

#投稿とユーザーの紐づけ
	belongs_to :user, optional: true, inverse_of: :contents

#コメントとの紐づけ
	has_many :comments, dependent: :destroy, inverse_of: :content

#お気に入り動画
	has_many :favorite_contents
  	has_many :users, :through => :favorite_contents
end
