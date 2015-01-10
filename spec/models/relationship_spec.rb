require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user2) }
  let!(:relationship) { Relationship.create!(follower: user, followee: user2) }

  it { expect(user.followees.to_a).to eq [user2] }
  it { expect(user2.followers.to_a).to eq [user] }
end
