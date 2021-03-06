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
      flash[:notice] = "Contact '#{@contact.full_name}' created Successfully"
      redirect_to(:controller => 'home', :action => 'index')

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
      flash[:notice] = "Contact '#{@contact.full_name}' has been updated"
      redirect_to(:action => 'show', :id => @contact.id)

    else
      render('edit')
    end
  end

  def destroy
    @contact = Contact.find(params[:id]).destroy
    flash[:notice] = "Contact '#{@contact.full_name}' has been deleted"
    redirect_to(:controller => 'home', :action => 'index')

  end

  def show
    @contact = Contact.find(params[:id])
    @friendships = @contact.friendships_build
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company_id, :position, :phone, :email, :image)
  end
end
