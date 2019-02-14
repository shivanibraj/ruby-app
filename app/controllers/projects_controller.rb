class ProjectsController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]  

  def index
    @projects = Project.all
  end

  def show
  # @project = Project.find(params[:id])

  end

  def new
    @project = Project.new
  end

  def edit
    #@project = Project.find(params[:id])
  end

  def create
  @project = Project.new(project_params)
 
  if @project.save
    redirect_to projects_path
  else
    render 'new'
  end
end

  def update
    #@project = Project.find(params[:id])

    @project.update(project_params)

    redirect_to project_path(@project)
  end
  
 def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

private
  def project_params
    params.require(:project).permit(:name, :description, :tech_stack, :clent_details)
end 

def current_project
    @project = Project.find(params[:id])
  end
end