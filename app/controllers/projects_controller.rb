class ProjectsController < ActionController::Base
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @tickets = @project.tickets
  end
end