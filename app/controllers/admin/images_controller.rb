class Admin::ImagesController < Admin::AdminController
  before_action :set_post, only: [ :edit, :update, :destroy ]
  def new
    @image = Image.new
  end

  def create
      @image = Image.new (image_params)
      if @image.save
        redirect_to @image, success: 'Пост успішно створено!'
    else
        render :new, danger: 'Пост не створено!'
      end
    end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path, success: 'Пост успішно видалено!'
  end

  def edit
      @image = Image.find(params[:id])
    end

  private
  def set_image
    @image = Image.find(params[:id])
  end
    def image_params
      params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type, :remote_image_url)
    end
  end
