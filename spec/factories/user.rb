FactoryBot.define do
    factory :user do
      id {1}
      email {"test@test.com"}
      password {"password"}
      contact_no{"123456789"}
      name{"test"}
    end
  end