require 'rails_helper'

RSpec.describe TwitterIntegration, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:twitter_integration) { FactoryGirl.create(:twitter_integration, user: user) }

  it { expect(twitter_integration.user).to eq(user) }
  it { expect(twitter_integration).to eq(user.twitter_integration) }
  it { expect(twitter_integration).to respond_to(:uid) }
  it { expect(twitter_integration).to respond_to(:access_token) }
  it { expect(twitter_integration).to respond_to(:access_secret) }
end
