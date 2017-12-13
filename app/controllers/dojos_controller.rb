class DojosController < ApplicationController


  def create
    @dojo=Dojo.new(dojo_params)
    if @dojo.save
      session[:dojo_id]=@dojo.id
      redirect_to "/dojos/#{@dojo.id}"
    else 
      redirect_to "sessions/new"
    end
  end

  def new
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def edit
  end

  private
  def dojo_params
    params.require(:dojo).permit(:first_name, :email, :password, :password_confirmation)
  end
end
