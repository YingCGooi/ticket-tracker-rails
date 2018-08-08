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
    # @project.creator = current_user

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
    if @project.update(project_params)
      flash[:notice] = "Your project was updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "The project \"#{@project.name}\" has been deleted."
      redirect_to projects_path
    else
      flash[:alert] = "The project \"#{@project.name}\" cannot be deleted."
      redirect_to :back
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])    
  end
end