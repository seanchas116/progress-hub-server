require 'rails_helper'

RSpec.describe Project, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, user: user) }
  let(:task) { FactoryGirl.create(:task, project: project) }

  it { expect(project.user).to eq user }
  it { expect(project.user.projects).to eq [project] }
  it { expect(project).to respond_to(:title) }
  it { expect(project).to respond_to(:url) }
  it { expect(project).to respond_to(:description) }
end
