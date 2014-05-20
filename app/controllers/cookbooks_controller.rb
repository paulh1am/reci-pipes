class CookbooksController < ApplicationController

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
  @cookbook = Cookbook.create(book_params)
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
  @cookbook = Cookbook.find(params[:cooknook_id])
  @cookbook.update(cookbook_params)
  redirect_to "/chefs/#{@chef.id}/cookbooks/#{cookbook.id}"
end
def destroy
   @chef = Chef.find(params[:chef_id])
    Cookbook.delete(params[:cookbook_id])
    redirect_to "/chefs/#{@chef.id}/moons"
  end


private
def book_params
  params.require(:cookbook).permit(:title, :cover_art_url, :chef_id)
end
end
