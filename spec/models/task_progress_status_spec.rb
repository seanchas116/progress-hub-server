require 'rails_helper'

describe TaskProgressStatus, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, user: user) }
  let!(:task) do
    FactoryGirl.create(:task, project: project).tap do |task|
      task.stage = :done
      task.save!
    end
  end
  let(:status) { user.statuses.last }

  it { expect(status).to be_a(TaskProgressStatus) }
  it { expect(status.user).to eq(user) }
  it { expect(status.task).to eq(task) }
  it { expect(status.task_stage_before.todo?).to eq(true) }
  it { expect(status.task_stage_after.done?).to eq(true) }
end
