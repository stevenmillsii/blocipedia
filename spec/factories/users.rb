FactoryGirl.define do

  factory :user do
    email "#{RandomData.random_word}@#{RandomData.random_word}.com"
    password "testpassword"
    password_confirmation "testpassword"
  end

end
