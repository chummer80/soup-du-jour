FactoryGirl.define do
  factory :valid_user, class: User do
  	email "test@test.com"
  	password "asdfasdf"
  	zip_code "12345"
  	interests ["monkeys", "cars"]
  	morsels ["soup", "restaurant"]
  end

end
