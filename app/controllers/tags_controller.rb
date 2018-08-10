class TagsController < ApplicationController
  before_action :require_user, except: [:index]

  def index
    @tags = Tag.order(:name)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = "A new tag has been created!"
      redirect_to tags_path
    else
      render :new
    end    
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    update_item @tag, tag_params, tags_path
  end

  def destroy
    destroy_item Tag, tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end