class ContactsController < ApplicationController
  def new
  end

  def create
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def show
  end
end
