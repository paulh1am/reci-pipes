class CookbooksController < ApplicationController

before_action :authorize

def index
  @cookbooks = Cookbook.all
   @chef = Chef.find(params[:chef_id])
end

def new
  @cookbook = Cookbook.new
  @chef = Chef.find(params[:chef_id])
  #show a form
end
def create
  @chef = Chef.find(params[:chef_id])
  @cookbook = Cookbook.create(cookbook_params)
  #params.require(:chef).permit(:name))
  @chef.cookbooks << @cookbook    
  redirect_to chef_cookbooks_path
end
def edit
  @chef = Chef.find(params[:chef_id])
  @cookbook = Cookbook.find(params[:cookbook_id])
end
def show
  @cookbook = Cookbook.find(params[:id])
  @chef = Chef.find(params[:chef_id])

end
def edit
  @chef = Chef.find(params[:chef_id])
  @cookbook = Cookbook.find(params[:id])

end
def update
  @chef = Chef.find(params[:chef_id])
  edited_cookbook = Cookbook.find(params[:id])
  edited_cookbook.update(cookbook_params)
  redirect_to chef_cookbook_path
end
def destroy
   @chef = Chef.find(params[:chef_id])
    Cookbook.delete(params[:id])
    redirect_to chef_cookbooks_path
  end





private
def cookbook_params
  params.require(:cookbook).permit(:title, :cover_art_url, :chef_id)
end
end
