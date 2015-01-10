require 'rails_helper'

describe UserFollowStatus, type: :model do

  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user2) }
  let!(:relationship) { Relationship.create!(follower: user, followee: user2) }
  let(:status) { user.statuses.first }

  it { expect(status).to be_a(UserFollowStatus) }
  it { expect(status.user).to eq(user) }
  it { expect(status.followee).to eq(user2) }
end
