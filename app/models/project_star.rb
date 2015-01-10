# == Schema Information
#
# Table name: project_stars
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  project_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_project_stars_on_project_id              (project_id)
#  index_project_stars_on_user_id                 (user_id)
#  index_project_stars_on_user_id_and_project_id  (user_id,project_id) UNIQUE
#

class ProjectStar < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
end
