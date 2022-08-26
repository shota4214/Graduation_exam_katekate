FactoryBot.define do
  factory :user do
    name { "test_name" }
    email { "test@test.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
  factory :second_user, class: User do
    name { "second_name" }
    email { "second@test.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
  factory :third_user, class: User do
    name { "third_name" }
    email { "third@test.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
  factory :admin_user, class: User do
    name { "admin_name" }
    email { "admin@test.com" }
    admin { "true" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
  factory :sender_user, class: User do
    name { "sender" }
    email { "sender@test.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
  factory :recipient_user, class: User do
    name { "recipient" }
    email { "recipient@test.com" }
    password { "12345678" }
    password_confirmation { "12345678" }
  end
end
