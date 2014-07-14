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

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update(pictures_params)
      redirect_to picture_path(@picture), notice: "Your picture was successfully updated!"
    else
      flash.now[:alert] = "Your picture was not updated..."
      render @picture
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to root_path
    flash.now[:alert] = "Your picture was removed..."
  end
private

  def pictures_params
    params.require(:picture).permit(:title, :caption, :author)
  end
end
