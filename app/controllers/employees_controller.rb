class EmployeesController < ApplicationController
  before_action :current_employee, only: [:show, :edit, :update, :destroy]
  def auto_suggest
    employees = Employee.where("emp_name RLIKE ?", params[:term])
  
    render json: employees.as_json(:only => [:id, :emp_name])
  end

  def index
   unless params[:query_text].blank?
      @employees = Employee.where("emp_name RLIKE ?", params[:query_text])  
    else
      @employees =Employee.all
    end
    
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
   
    if @employee.save
      redirect_to @employee, notice: "New employee created successfully."
    else
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee)
    else
      render :edit
    end
  end
  

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_path
  end

  private
    def employee_params
      params.require(:employee).permit(:employee_id, :emp_name, :designation, :image, project_ids: [])
    end 

    def current_employee
      @employee = Employee.find(params[:id])
    end
end
