# == Schema Information
#
# Table name: twitter_integrations
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  uid           :string           not null
#  access_token  :string           not null
#  access_secret :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_twitter_integrations_on_uid      (uid)
#  index_twitter_integrations_on_user_id  (user_id)
#

class TwitterIntegration < ActiveRecord::Base
  belongs_to :user
end
