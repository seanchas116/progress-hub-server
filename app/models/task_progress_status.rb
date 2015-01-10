# == Schema Information
#
# Table name: statuses
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  type              :string
#  project_id        :integer
#  task_id           :integer
#  task_stage_before :string
#  task_stage_after  :string
#  followee_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_statuses_on_type     (type)
#  index_statuses_on_user_id  (user_id)
#

class TaskProgressStatus < Status
  extend Enumerize

  belongs_to :task
  enumerize :task_stage_before, in: Task::STAGES
  enumerize :task_stage_after, in: Task::STAGES
end
