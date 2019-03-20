require 'rails_helper'


RSpec.describe EmployeesController, type: :controller do
  # subject { Employee.new }
  let(:employee) {FactoryGirl.create(:employee)}

  describe "GET #index" do
    before do 
      2.times { FactoryGirl.create(:employee) } 
      get :index
    end
    it {  expect(response).to have_http_status(:success) }
    it {  expect(subject).to render_template(:index) }
    it {  expect(assigns(:employees)).to match(Employee.all) }
  end

  describe "GET #new" do 
    it "assigns a new Employee as @employee" do
      get :new, params: {}
      expect(assigns(:employee)).to be_a_new(Employee) 
    end
  end 

  describe '#show' do
    context 'when requested user exists' do 
      before(:each) { get :show, id: employee.id }

      it 'assigns it to @employee' do
        expect(assigns(:employee)).to eq(employee)
      end

      it 'success' do
        expect(response).to be_success
      end
    end
  end

  describe "GET #edit" do 
    context "edits the requested employee record" do 
      before(:each) {get :edit, **new_values, id: employee.id }


    context 'when valid' do
      let(:new_values) { FactoryGirl.attributes_for(:employee) }


      it 'assigns it to @employee' do
      expect(assigns(:employee)).to eq(employee)
      end

      it 'success' do
        expect(response).to be_success
      end
    end
    end
  end
  
  describe "PUT 'update/:id'" do
    it "allows an employee to be updated" do
      prev_updated_at = employee.updated_at
      @attr = { :emp_name => "new name"}
      put :edit, :id => employee.id, :employee => @attr
      employee.reload
      expect(employee.updated_at).to_not eq(prev_updated_at) 
    end
  end
end

