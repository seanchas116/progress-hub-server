# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followee_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_relationships_on_followee_id                  (followee_id)
#  index_relationships_on_follower_id                  (follower_id)
#  index_relationships_on_follower_id_and_followee_id  (follower_id,followee_id) UNIQUE
#

class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: User, foreign_key: :follower_id
  belongs_to :followee, class_name: User, foreign_key: :followee_id

  after_create do
    UserFollowStatus.create!(
      user: follower,
      followee: followee)
  end
end
