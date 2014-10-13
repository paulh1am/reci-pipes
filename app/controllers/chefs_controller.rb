class ChefsController < ApplicationController

  before_action :authorize, except: [:index, :new, :show, :create]

  def index
    @chef = current_chef
    @chefs = Chef.all
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.create(chef_params)
    if @chef.save
      redirect_to chefs_path
    else
      render 'chefs/new'
    end
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    edited_chef = Chef.find(params[:id])
    edited_chef.update(params.require(:chef).permit(:name))
    redirect_to "/chefs/#{edited_chef.id}"
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def destroy
    Chef.delete(params[:id])
    redirect_to log_out_path, method: :delete
  end

  private
  def chef_params
    params.require(:chef).permit(:name, :phone_number, :password, :password_confirmation )
  end

end
