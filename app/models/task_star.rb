# == Schema Information
#
# Table name: task_stars
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_task_stars_on_task_id              (task_id)
#  index_task_stars_on_user_id              (user_id)
#  index_task_stars_on_user_id_and_task_id  (user_id,task_id) UNIQUE
#

class TaskStar < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
end
