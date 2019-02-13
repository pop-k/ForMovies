class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#動画投稿
  mount_uploader :image, ImageUploader

#投稿とユーザーの紐づけ
  has_many :contents, dependent: :destroy, inverse_of: :user

#コメントとの紐づけ
  has_many :comments, dependent: :destroy, inverse_of: :user

#入金申請との紐づけ
  has_many :payments, dependent: :destroy, inverse_of: :user

#投げ銭との紐づけ
  has_many :nagesens, dependent: :destroy, inverse_of: :user

#お気に入り動画
  has_many :favorite_contents
  has_many :content, :through => :favorite_contents

#ユーザーフォロー機能
  has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :active_relationships
  has_many :followers, through: :passive_relationships

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end
# フォローボタンの切り替え
  def following?(other_user)
    followings.include?(other_user)
  end
end
