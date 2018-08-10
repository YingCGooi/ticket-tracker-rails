class CommentsController < ApplicationController
  before_action :require_user

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      set_status(@comment.ticket)
      flash[:notice] = 'Your comment has been created!'
      redirect_back fallback_location: ticket_path(@comment.ticket)      
    else
      flash[:alert] = 'Please enter a valid comment.'
      redirect_back fallback_location: tickets_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @ticket = Ticket.find(params[:ticket_id])
    @statuses = Ticket.status_options
  end

  def update
    @comment = Comment.find(params[:id])
    @ticket = Ticket.find(params[:ticket_id])    

    if @comment.update(comment_params)
      set_status(@comment.ticket)
      flash[:notice] = 'Your comment has been updated!'
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    destroy_item Comment, 
      ticket_path(params[:ticket_id]), 
      "Your comment has been deleted."
  end

  private

  def set_status(ticket)
    status = params[:status]      
    if status.present?
      ticket.status = status
      ticket.save
    end
  end

  def comment_params
    { body: params[:comment][:body], ticket_id: params[:ticket_id] }
  end
end