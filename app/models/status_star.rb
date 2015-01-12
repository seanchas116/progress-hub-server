# == Schema Information
#
# Table name: status_stars
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  status_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_status_stars_on_status_id              (status_id)
#  index_status_stars_on_user_id                (user_id)
#  index_status_stars_on_user_id_and_status_id  (user_id,status_id) UNIQUE
#

class StatusStar < ActiveRecord::Base
  belongs_to :status
  belongs_to :user
end
