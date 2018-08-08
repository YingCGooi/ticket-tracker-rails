class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update]
  before_action :set_options, only: [:new, :create, :edit, :update]
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
    # @comment = Comment.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

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
    if @ticket.update(ticket_params)
      flash[:notice] = "Your ticket was successfully updated."
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.where(id: params[:id]).first
    if @ticket.blank?
      flash[:alert] = "Cannot perform delete."
      return redirect_to tickets_path
    end

    @ticket.destroy
    flash[:notice] = "The ticket \"#{@ticket.name}\" has been deleted."
    redirect_to tickets_path
  end

  private

  def set_options
    @statuses = Ticket.status_options    
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id, tag_ids: [])
  end
end