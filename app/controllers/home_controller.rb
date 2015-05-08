class HomeController < ApplicationController
  def index
    @companies = Company.all
    @contacts = Contact.all
  end
end
