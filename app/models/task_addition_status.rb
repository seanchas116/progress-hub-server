# == Schema Information
#
# Table name: statuses
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  type              :string           not null
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

class TaskAdditionStatus < Status
  belongs_to :task

  validates :task, presence: true
end
