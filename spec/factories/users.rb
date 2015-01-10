FactoryGirl.define do
  factory :user do
    name 'foo_bar'
    email 'foo@bar.com'
    twitter_id '12345'
  end

  factory :user2, class: User do
    name 'hoge_piyo'
    email 'hoge@piyo.com'
    twitter_id '67890'
  end
end
