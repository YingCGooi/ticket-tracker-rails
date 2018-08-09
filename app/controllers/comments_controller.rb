class CommentsController < ApplicationController
  before_action :require_user

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      set_status(@comment.ticket)
      flash[:notice] = 'Your comment has been created!'
      redirect_back fallback_location: ticket_path(@comment.ticket)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @statuses = Ticket.status_options
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      set_status(@comment.ticket)
      flash[:notice] = 'Your comment has been updated!'
      redirect_to ticket_path(ticket)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if @comment.blank?
      flash[:alert] = "Cannot perform delete."
      return redirect_back fallback_location: root_path
    end

    @comment.destroy
    flash[:notice] = "Your comment has been deleted."
    redirect_to ticket_path(@comment.ticket)
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
    { body: params[:comment][:body], ticket_id: params[:id] }
  end
end