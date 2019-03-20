require 'rails_helper'
RSpec.describe Employee, type: :model do
  subject { Employee.new }

  it "is valid with valid attributes" do
    subject.emp_name = "Anything"
    subject.designation = "Anything"
    subject.employee_id = Faker::Number.number(8)
    expect(subject).to be_valid
  end

  it "is not valid without employee name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a designation" do
    subject.emp_name = "Anything"
    expect(subject).to_not be_valid
  end

  it "is not valid without a employee employee_id" do
    subject.emp_name= "Anything"
    subject.designation = "test analyst"
    expect(subject).to_not be_valid
  end

  describe 'employee details' do
    let(:employee) { FactoryGirl.create :employee }
  
    it 'should initialize employee with name and designation' do
      expect(employee.emp_name).to be_kind_of(String)
    end

    it " should validate the maximum length of the designation" do 
    should validate_length_of(:designation).is_at_most(20) 
    expect(employee).to be_valid
    end

    it 'employee_id should be unique' do
      employee.valid?
      expect(employee).to validate_uniqueness_of(:employee_id)
    end

    it "fails validation when another employee with the same employee_id exists" do
     first_emp_id = FactoryGirl.create(:employee, employee_id: "121")
     second_emp_id = FactoryGirl.build(:employee, employee_id: "121")
     second_emp_id.validate
     #expect(second_emp_id.errors[:employee_id]).to include("has already been taken")
     expect(second_emp_id).to_not be_valid
    end

    it 'uniqueness of employee_id'do
    emp = FactoryGirl.build(:employee, employee_id: "567123")
    expect(emp).to validate_uniqueness_of(:employee_id)

    end
  end
 
  
end