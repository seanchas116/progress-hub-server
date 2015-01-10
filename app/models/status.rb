class Status < ActiveRecord::Base
  belongs_to :user
  has_many :status_stars, dependent: :destroy
end
