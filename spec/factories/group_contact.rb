FactoryGirl.define do
  factory :group_contact do
    association :group
    association :contact
  end
end
