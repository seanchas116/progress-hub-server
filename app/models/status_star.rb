class StatusStar < ActiveRecord::Base
  belongs_to :status, dependent: :destroy
  belongs_to :user
end
