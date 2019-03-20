require "rails_helper"

RSpec.describe"employee details", js: true do 
  
  scenario "new employee created" do
   
    visit "/employees/new"
    
    fill_in 'employee_employee_id', :with => '1'
    fill_in "employee_emp_name:", :with => "pavani"
    fill_in "employee_designation", :with => "analyst"
    click_button "Create Employee"

    expect(page).to have_text("New employee created successfully.")
  end
end

