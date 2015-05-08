class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to(:action => 'index')

    else
      render('new')
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(contact_params)
      redirect_to(:action => 'show', :id => @contact.id)

    else
      render('edit')
    end
  end

  def destroy
    @contact = Contact.find(params[:id]).destroy
    redirect_to(:action => 'index')

  end

  def show
    @contact = Contact.find(params[:id])
    @friendships = Friendship.where(:contact => @contact) + Friendship.where(:friend => @contact)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company_id, :position, :phone, :email)
  end
end
