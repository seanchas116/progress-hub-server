require 'rails_helper'

RSpec.describe StatusStar, :type => :model do

  let(:user) { FactoryGirl.create(:user) }
  let(:task) { FactoryGirl.create(:task) }

  let(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project, user: user) }
  let(:status) { user.statuses.first }

  let(:status_star) { StatusStar.create(user: user, status: status) }

  it { expect(status_star.user).to eq(user) }
  it { expect(status_star.status).to eq(status) }
end
