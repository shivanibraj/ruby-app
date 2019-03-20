class ProjectsController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]

  def auto_suggest
    projects = Project.where("name RLIKE ?", params[:term])
  
    render json: projects.as_json(:only => [:id, :name])
  end

  def index
    unless params[:query_text].blank?
      @projects = Project.where("name RLIKE ?", params[:query_text])  
    else
      @projects = Project.all
    end
    
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
   
    if @project.save
      redirect_to @project, notice: "New project created successfully."
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end
  
  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Record deleted successfully."
    else
      redirect_to projects_path, alert: "Error: Record not deleted"
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :tech_stack, :clent_details,
        employee_ids: [])
    end 

    def current_project
      @project = Project.find(params[:id])
    end
end