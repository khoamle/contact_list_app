class ContactsController < ApplicationController
  def index
    @groups = Group.all
    if params[:group]
      @contacts = Group.find_by(name: params[:group]).contacts.where(user_id: current_user.id)
    end
    if user_signed_in?
      @contacts = current_user.contacts
    else
      @contacts = Contact.all
    end
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
    @coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.new(first_name: params[:first_name], middle_name: params[:middle_name],last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], address: params[:address], user_id: current_user.id)
    if @contact.save
      flash[:success] = "Contact sucessfully created!"
      redirect_to "/contacts/#{@contact.id}"
    else
      render "new"
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(first_name: params[:first_name], middle_name: params[:middle_name],last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], latitude: params[:latitude], longitude: params[:longitude], address: params[:address])
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

end
