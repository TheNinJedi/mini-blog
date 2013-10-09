class SessionsController < ApplicationController
  def new
  end

  def create
    author = User.find_by_email(params[:email])
    if author && author.authenticate(params[:password])
      session[:author_id] = author.id
      #cookies[:author_id] = author.id
      redirect_to root_url, notice: "You Are Now Signed In!"
    else 
      flash.now.alert = "Email or password is invalid!"
      render :new
    end
  end
end

