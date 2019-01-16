class Admin::CapsController < Admin::AdminController

  before_action :set_cap, only: [ :edit, :update, :destroy ]


  def new
      @cap = Cap.new
    end

  def create
      @cap = Cap.new (cap_params)
      if @cap.save
        redirect_to @cap, success: 'Опис успішно створено!'
    else
        render :new, danger: 'Опис не створено!'
      end
    end


    def edit
        @cap = Cap.find(params[:id])
      end

    def update
      @cap = Cap.find(params[:id])
        if @cap.update_attributes(cap_params)
          redirect_to @cap, success: 'Успішно оновлено!'
        else
          render :edit, danger: 'Не оновлено!'
        end
      end


    def destroy
      @cap.destroy
      redirect_to caps_path, success: 'Опис успішно видалено!'
    end

  private
    def set_cap
      @cap = Cap.find(params[:id])
    end

    def cap_params
      params.require(:cap).permit( :body, :image)
    end
  end
