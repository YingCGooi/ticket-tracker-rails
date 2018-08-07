class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
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
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Your project was updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])

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
end