class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: User, foreign_key: :follower_id
  belongs_to :followee, class_name: User, foreign_key: :followee_id

  after_create do
    UserFollowStatus.create!(
      user: follower,
      followee: followee)
  end
end