class Payment < ApplicationRecord

#入金申請とユーザーの紐づけ
  belongs_to :user, optional: true, inverse_of: :payments

end
