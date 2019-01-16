class Admin::PostsController < Admin::AdminController

  before_action :set_post, only: [ :edit, :update, :destroy ]


  def new
      @post = Post.new
    end

  def create
      @post = Post.new (post_params)
      if @post.save
        redirect_to @post, success: 'Пост успішно створено!'
    else
        render :new, danger: 'Пост не створено!'
      end
    end


    def edit
        @post = Post.find(params[:id])
      end

    def update
      @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
          redirect_to @post, success: 'Успішно оновлено!'
        else
          render :edit, danger: 'Не оновлено!'
        end
      end


    def destroy
      @post.destroy
      redirect_to posts_path, success: 'Пост успішно видалено!'
    end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit( :title, :summary, :body, :image, :all_tags, :category_id)
    end
  end
