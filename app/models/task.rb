class Task < ActiveRecord::Base
  STAGES = %i(todo doing done)
  extend Enumerize

  belongs_to :project
  has_many :task_stars, dependent: :destroy

  enumerize :stage, in: STAGES

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
