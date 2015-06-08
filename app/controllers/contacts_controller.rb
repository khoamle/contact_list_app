class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def create
    @coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.create(first_name: params[:first_name], middle_name: params[:middle_name],last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], latitude: coordinates[0], longitude: coordinates[1], address: params[:address])
    flash[:success] = "Contact sucessfully created!"
    redirect_to "/contacts/#{@contact.id}"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(first_name: params[:first_name], middle_name: params[:middle_name],last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], bio: params[:bio], latitude: params[:latitude], longitude: params[:longitude], address: params[:address])
    flash[:success] = "Contact sucessfully updated!"
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:warning] = "Contact sucessfully deleted!"
    redirect_to "/contacts"
  end
  def search
    search_term = params[:search]
    @contacts = Contact.where("first_name LIKE ? or middle_name LIKE ? or last_name LIKE ? or email LIKE ? or phone_number LIKE ? or bio LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    render :index
  end

end
