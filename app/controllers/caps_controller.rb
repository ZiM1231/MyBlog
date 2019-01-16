class CapsController < ApplicationController
  before_action :set_cap, only: :show

  def index
      @caps = Cap.paginate(page: params[:page], per_page:12)
  end

  def show
      @cap = Cap.find(params[:id])
    end

  private
    def set_cap
      @cap = Cap.find(params[:id])
    end
  end
