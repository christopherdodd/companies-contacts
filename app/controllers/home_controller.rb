class HomeController < ApplicationController
  def index
    @companies = Company.all
    @contacts = Contact.all
    @friendships = Friendship.all
  end
end
