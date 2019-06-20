class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy

  # この行を追加する
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  def liked_by(current_user)
    # user_idが一致するlikeを検索する
    Like.find_by(user_id: current_user.id, post_id: id)
  end
end