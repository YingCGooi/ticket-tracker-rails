class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]

  def index
    @projects = Project.all
  end

  def show
    @tickets = @project.tickets
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Your project \"#{@project.name}\" was created."
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    update_item @project, project_params, project_path(@project)
  end

  def destroy
    destroy_item Project, projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])    
  end
end