# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    completed false
    snooze "2014-11-07"
    user_id 1
    goal_id 1
    deleted false
  end
end
