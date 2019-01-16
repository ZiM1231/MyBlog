class ImagesController < ApplicationController


  def index
    @images =  Image.all
  end


  private
  def set_image
    @image = Image.find(params[:id])
  end
    def image_params
      params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type, :remote_image_url)
    end
  end
