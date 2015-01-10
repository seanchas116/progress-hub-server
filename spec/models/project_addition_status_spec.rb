require 'rails_helper'

describe ProjectAdditionStatus, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project, user: user) }
  let(:status) { user.statuses.first }

  it { expect(status).to be_a(ProjectAdditionStatus) }
  it { expect(status.user).to eq(user) }
  it { expect(status.project).to eq(project) }
end
