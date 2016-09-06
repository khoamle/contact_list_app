class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contact sucessfully created!"
      redirect_to "/contacts/#{@contact.id}"
    else
      render "new"
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(contact_params)
    if @contact.save
    flash[:success] = "Contact sucessfully updated!"
    redirect_to "/contacts/#{@contact.id}"
    else
      render "edit"
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:warning] = "Contact sucessfully deleted!"
    redirect_to "/contacts"
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :middle_name, :last_name, :email, :phone_number, :bio, :address)
  end

end
