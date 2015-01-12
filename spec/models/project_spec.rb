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

  context 'on delete' do
    before do
      user.destroy
    end

    it { expect(Project.count).to eq(0) }
  end
end
