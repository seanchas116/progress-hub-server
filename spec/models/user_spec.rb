require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create(:user) }

  it { expect(user).to respond_to(:name) }
  it { expect(user).to respond_to(:email) }
end
