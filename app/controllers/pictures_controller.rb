class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def create
    @picture = Picture.create(pictures_params)
  end
private

  def pictures_params
    params.require(:picture).permit(:title, :caption, :author, :user_id)
  end
end
