class SessionsController < ApplicationController
  def new
      # render login page
  end
  def create
      # Log User In
      @dojo=Dojo.find_by_email(params[:email])
      # if authenticate true
      if @dojo && @dojo.authenticate(params[:password])
          # save user id to session
          session[:dojo_id]=@dojo.id
          # redirect to users profile page
          redirect_to "/dojos/#{@dojo.id}"
      # if authenticate false
          # add an error message -> flash[:errors] = ["Invalid"]
          # redirect to login page
      else
        flash[:errors]=["Invalid combination"]
        redirect_to "/sessions/new"
      end

  end
  def destroy
      # Log User out
      # set session[:user_id] to null
      # redirect to login page
  end
end
