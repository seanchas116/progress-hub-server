class TaskProgressStatus < Status
  extend Enumerize

  belongs_to :task
  enumerize :task_stage_before, in: Task::STAGES
  enumerize :task_stage_after, in: Task::STAGES
end
