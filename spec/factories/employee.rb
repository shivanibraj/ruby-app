require 'faker'
FactoryGirl.define do
  factory :employee do 
    employee_id { Faker::Number.number(8) }
    emp_name { Faker::Name.first_name}
    designation { Faker::Job.position}
    
  end
end