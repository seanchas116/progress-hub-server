FactoryGirl.define do
  factory :task do
    title 'Increase coverage'
    description 'Increase test coverage'
    url 'http://example.com'
    stage :todo
  end
end
