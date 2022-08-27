FactoryBot.define do
  factory :conversation do
    association :user, factory: :sender_id
    association :user, factory: :recipient_id
  end
end