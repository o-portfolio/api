FactoryGirl.define do
  factory :auth_user, class: "User" do
    first_name "Jeremy"
    last_name "Walker"
    email "email"
    password "password"
  end

  factory :entry do
    title "Foobar"
    occurred_at DateTime.new(2013,1,2,3,4,5,6,7)
    image_latitude 100 
    image_longitude 200 
    description "Some description"
    reflection "Some reflection"
  end
end
