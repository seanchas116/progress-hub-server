require 'rails_helper'

describe TaskAdditionStatus, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, user: user) }
  let!(:task) { FactoryGirl.create(:task, project: project) }
  let(:status) { user.statuses.last }

  it { expect(status).to be_a(TaskAdditionStatus) }
  it { expect(status.user).to eq(user) }
  it { expect(status.task).to eq(task) }
end
