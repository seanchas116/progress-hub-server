require 'rails_helper'

RSpec.describe ProjectStar, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:owner) { FactoryGirl.create(:user2) }
  let(:project) { FactoryGirl.create(:project, user: owner) }
  let(:project_star) { ProjectStar.create(user: user, project: project) }

  it { expect(project_star.user).to eq(user) }
  it { expect(project_star.project).to eq(project) }

  it { expect(user.project_stars).to include(project_star) }
  it { expect(project.project_stars).to include(project_star) }
end
