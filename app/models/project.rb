class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :project_stars, dependent: :destroy

  after_create do
    ProjectAdditionStatus.create!(user: user, project: self)
  end
end
