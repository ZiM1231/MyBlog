class Admin::PanelsController < Admin::AdminController

  before_action :set_panel, only: [ :edit, :update, :destroy ]


  def new
      @panel = Panel.new
    end

  def create
      @panel = Panel.new (panel_params)
      if @panel.save
        redirect_to @panel, success: 'Пост успішно створено!'
    else
        render :new, danger: 'Пост не створено!'
      end
    end


    def edit
        @panel = Panel.find(params[:id])
      end

    def update
      @panel = Panel.find(params[:id])
        if @panel.update_attributes(panel_params)
          redirect_to @panel, success: 'Успішно оновлено!'
        else
          render :edit, danger: 'Не оновлено!'
        end
      end


    def destroy
      @panel.destroy
      redirect_to panels_path, success: 'Пост успішно видалено!'
    end

  private
    def set_panel
      @panel = Panel.find(params[:id])
    end

    def panel_params
      params.require(:panel).permit( :title, :body)
    end
  end
