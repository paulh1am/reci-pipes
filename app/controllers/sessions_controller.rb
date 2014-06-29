class SessionsController < ApplicationController

  def new
    #go to login form
  end

  def create
    chef = Chef.find_by(name: params[:name])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      redirect_to profiles_path, notice: "signed in as #{chef.name}"

    else
      redirect_to log_in_path, alert: 'log-in failed'
    end
  end

  def destroy
    session[:chef_id] = nil
    redirect_to chefs_path, notice: "Logged Out"
  end

end
