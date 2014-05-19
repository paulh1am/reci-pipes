class SessionController < ApplicationController

  def new
    #go to login form
  end

  def create
    chef = Chef.find_by(name: params[:name])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef_id
      redirect_to root_path, notice: "signed in as #{chef.name}"

    else
      redirect_to sessions_new_path, alert: 'log-in failed'
    end
  end

def destroy
  session[:chef_id] = nil
end



  end
