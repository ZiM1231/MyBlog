class Admin::ContactsController < Admin::AdminController

  before_action :set_contact, only: [ :edit, :update, :destroy ]


  def new
      @contact = Contact.new
    end

  def create
      @contact = Contact.new (contact_params)
      if @contact.save
        redirect_to @contact, success: 'Пост успішно створено!'
    else
        render :new, danger: 'Пост не створено!'
      end
    end


    def edit
        @contact = Contact.find(params[:id])
      end

    def update
      @contact = Contact.find(params[:id])
        if @contact.update_attributes(contact_params)
          redirect_to @contact, success: 'Успішно оновлено!'
        else
          render :edit, danger: 'Не оновлено!'
        end
      end


    def destroy
      @contact.destroy
      redirect_to contacts_path, success: 'Пост успішно видалено!'
    end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit( :title, :body, :image)
    end
  end
