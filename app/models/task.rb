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

  after_create :record_addition
  before_save :record_progress

  def record_addition
    TaskAdditionStatus.create!(user: project.user, task: self)
  end

  def record_progress
    return unless stage_changed?
    return unless stage_was.present?
    return unless STAGES.index(stage_was.to_sym) < STAGES.index(stage.to_sym)

    TaskProgressStatus.create!(
      user: project.user,
      task: self,
      task_stage_before: stage_was,
      task_stage_after: stage)
  end
end
