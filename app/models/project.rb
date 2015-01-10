# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
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

  after_create do
    ProjectAdditionStatus.create!(user: user, project: self)
  end
end
