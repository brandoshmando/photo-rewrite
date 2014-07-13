class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pictures_params)
    # @picture.user_id = current_user.id
    if @picture.save
      redirect_to picture_path(@picture),notice: "Picture successfully created!"
    else
      flash.now[:alert] = "Your picture was not created..."
    end
  end
private

  def pictures_params
    params.require(:picture).permit(:title, :caption, :author)
  end
end
