# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  title       :string           not null
#  description :text
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :project_stars, dependent: :destroy

  validates :url, allow_blank: true, format: URI.regexp(%w(http https))

  after_create do
    ProjectAdditionStatus.create!(user: user, project: self)
  end
end
