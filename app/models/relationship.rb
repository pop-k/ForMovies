class Relationship < ApplicationRecord

	belongs_to :follower, class_name: "User"
	belongs_to :following, class_name: "User"
	  # 現在のユーザーがフォローしてたらtrueを返す



end
