class ProjectsController < ActionController::Base
  def index
    render plain: 'Hello world'
  end
end