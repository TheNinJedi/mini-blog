class SessionsController < ApplicationController
  def new
  end

  def create
    author = Author.find_by_email(params[:email])
    if author && author.authenticate(params[:password])
      session[:author_id] = author.id
      #cookies[:author_id] = author.id
      redirect_to root_url, notice: "You Are Now Signed In!"
      # flash.now.notice = "Signed In!"
      # redirect_to root_url
    else 
      flash.now.alert = "Email or password is invalid!"
      render :new
    end
  end

  def destroy
    session[:author_id] = nil
    redirect_to root_url, notice: "You Are Now Signed Out"
  end
end

