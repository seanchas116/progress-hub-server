# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#

class User < ActiveRecord::Base
  has_many :relationships_from, class_name: Relationship, foreign_key: :follower_id, dependent: :destroy
  has_many :relationships_to, class_name: Relationship, foreign_key: :followee_id, dependent: :destroy
  has_many :followees, through: :relationships_from, source: :followee
  has_many :followers, through: :relationships_to, source: :follower

  has_many :projects, dependent: :destroy
  has_many :statuses, dependent: :destroy

  has_many :project_stars, dependent: :destroy
  has_many :status_stars, dependent: :destroy
  has_many :task_stars, dependent: :destroy

  has_one :twitter_integration, dependent: :destroy

  validates :email, email: true
end
