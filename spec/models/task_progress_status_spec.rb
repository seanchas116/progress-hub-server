require 'rails_helper'

describe TaskProgressStatus, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, user: user) }
  let(:task) { FactoryGirl.create(:task, project: project) }
  let(:status) { TaskProgressStatus.where(user: user).first }

  context 'move stageu from todo to done' do
    let(:original_status) { :todo }
    before do
      task.stage = :done
      task.save!
    end

    it { expect(status).to be_a(TaskProgressStatus) }
    it { expect(status.user).to eq(user) }
    it { expect(status.task).to eq(task) }
    it { expect(status.task_stage_before.todo?).to eq(true) }
    it { expect(status.task_stage_after.done?).to eq(true) }
  end

  context 'move stage from done to todo' do
    let(:original_status) { :done }
    before do
      task.stage = :todo
      task.save!
    end
    it { expect(status).to be_nil }
  end
end
