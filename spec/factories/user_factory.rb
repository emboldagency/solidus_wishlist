FactoryBot.define do
  factory :user, class: 'Spree::User' do
    email { FFaker::Internet.email }
    password { 'secret' }
    password_confirmation { 'secret' }
    confirmed_at { Time.current }
  end
end
