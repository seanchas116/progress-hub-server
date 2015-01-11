FactoryGirl.define do
  factory :user do
    name 'foo_bar'
    email 'foo@bar.com'
  end

  factory :user2, class: User do
    name 'hoge_piyo'
    email 'hoge@piyo.com'
  end
end
