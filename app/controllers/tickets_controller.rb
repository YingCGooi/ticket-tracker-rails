class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update]
  before_action :set_options, only: [:new, :create, :edit, :update, :show]
  before_action :require_user, except: [:show, :index]

  def index
    @project_id = params[:project]
    @status = params[:status]
    @tickets = Ticket.filter_by(project_id: @project_id,
      status: @status)
    @statuses = Ticket.statuses
  end

  def new
    @ticket = Ticket.new
  end

  def show
    @comments = Comment.where(ticket_id: params[:id])
    @comment = Comment.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      flash[:notice] = "Your ticket \"#{@ticket.name}\" was created!"
      redirect_to tickets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    update_item @ticket, ticket_params, ticket_path(@ticket)
  end

  def destroy
    destroy_item Ticket, tickets_path
  end

  private

  def set_options
    @statuses = Ticket.status_options    
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id, :assignee_id, tag_ids: [])
  end
end