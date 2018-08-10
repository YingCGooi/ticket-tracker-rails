class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(name_params)

    if @tag.save
      flash[:notice] = "A new tag has been created!"
      redirect_to tags_path
    else
      redirect_to new_tag_path
    end    
  end

  def edit
  end

  def update
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])

    if @tag.blank?
      flash[:alert] = "Cannot perform delete."
      return redirect_to tags_path
    end

    @tag.destroy
    flash[:notice] = "The tag \"#{@tag.name}\" has been deleted."
    redirect_to tags_path
  end

  private

  def name_params
    name: params[:tag][:name]
  end
end