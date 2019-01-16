class ContactsController < ApplicationController
  before_action :set_contact, only: :show

  def index
      @contacts = Contact.paginate(page: params[:page], per_page:5)
    end

  def show
      @contact = Contact.find(params[:id])
    end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end
  end
