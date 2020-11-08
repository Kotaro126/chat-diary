FactoryBot.define do
  factory :user_post do
    image      { Faker::Lorem.sentence }
    title      { Faker::Name.name }
    content    { 'aaaaaa' }
    word_name  { 'aaaaaa' }
    example    { 'aaaaaa' }

    after(:build) do |user_post|
      user_post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end