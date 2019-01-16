class PanelsController < ApplicationController
  before_action :set_panel, only: :show

  def index
      @panels = Panel.paginate(page: params[:page], per_page:5)
    end

  def show
      @panel = Panel.find(params[:id])
    end

  private
    def set_panel
      @panel = Panel.find(params[:id])
    end
  end
