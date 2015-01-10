require 'rails_helper'

RSpec.describe Task, :type => :model do
  let(:project) { FactoryGirl.create :project }
  let(:task) { FactoryGirl.create :task, project: project }

  it { expect(task.project).to eq project }
  it { expect(task.project.tasks).to eq [task] }
  it { expect(task).to respond_to(:title) }
  it { expect(task).to respond_to(:url) }
  it { expect(task).to respond_to(:description) }
end
