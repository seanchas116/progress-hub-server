require 'rails_helper'

RSpec.describe TaskStar, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, user: user) }
  let(:task) { FactoryGirl.create(:task, project: project) }
  let(:task_star) { TaskStar.create(user: user, task: task) }

  it { expect(task_star.user).to eq(user) }
  it { expect(task_star.task).to eq(task) }

  it { expect(user.task_stars).to include(task_star) }
  it { expect(task.task_stars).to include(task_star) }
end
