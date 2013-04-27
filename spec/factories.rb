FactoryGirl.define do
  factory :auth_user, class: "User" do
    first_name "Jeremy"
    last_name "Walker"
    email "email"
    password "password"
  end

  sequence :email do |n|
    "test_#{n}_#{rand}@example.com"
  end

  factory :user, class: "User" do
    first_name "Jeremy"
    last_name "Walker"
    email { generate :email }
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

  factory :mini_cex_assessment do
    trainee { create :user }
    date DateTime.new(2013,1,2,3,4,5,6,7)
    assessor_name "Jeremy Walker"
    assessor_position "King of World"
    assessor_email "jez.walker@mgmail.com"
    clinical_setting "ward"
    clinical_problem_categories ["breathing", "circulation"]
    focus_of_encounter "discharge"
    case_summary "lorem ipsum"
    positive_areas "lorem ipsum"
    development_areas "lorem ipsum"
    comments "lorem ipsum"
  end
end
