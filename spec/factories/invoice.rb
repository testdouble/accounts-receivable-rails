FactoryBot.define do
  factory :invoice do
    client { Faker::Name.name }
    net_days { 30 }
    note { Faker::Config.random }
  end
end