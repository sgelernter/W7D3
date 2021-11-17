FactoryBot.define do
    factory :user do
        username {Faker::Name.name}
        password_digest {Faker::String.random(length:10)}
        session_token {Faker::Mountain.name}
    end
end