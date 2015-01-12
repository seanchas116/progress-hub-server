# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  project_id  :integer          not null
#  title       :string           not null
#  url         :string
#  stage       :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#  index_tasks_on_stage       (stage)
#

class Task < ActiveRecord::Base
  STAGES = %i(todo doing done)
  extend Enumerize

  belongs_to :project
  has_many :task_stars

  enumerize :stage, in: STAGES

  validates :url, allow_blank: true, format: URI.regexp(%w(http https))

  after_create do
    TaskAdditionStatus.create!(user: project.user, task: self)
  end

  before_save do
    if stage_changed? && stage_was.present?
      TaskProgressStatus.create!(
        user: project.user,
        task: self,
        task_stage_before: stage_was,
        task_stage_after: stage)
    end
  end
end
