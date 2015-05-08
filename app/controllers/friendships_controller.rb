class FriendshipsController < ApplicationController

  def index
    @friendships = Friendship.all
  end

  def show
    @friendship = Friendship.find(params[:id])
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      flash[:notice] = "Friendship created Successfully"
      redirect_to(:controller => 'home', :action => 'index')

    else
      render('new')
    end
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friendship = Friendship.find(params[:id])

    if @friendship.update_attributes(friendship_params)
      flash[:notice] = "Friendship updated"
      redirect_to(:action => 'show', :id => @friendship.id)

    else
      render('edit')
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id]).destroy
    flash[:notice] = "Friendship has been destroyed :("
    redirect_to(:controller => 'home', :action => 'index')

  end

  private

  def friendship_params
    params.require(:friendship).permit(:contact_id, :friend_id)
  end
end
