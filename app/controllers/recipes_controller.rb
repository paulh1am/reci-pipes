class RecipesController < ApplicationController

before_action :authorize, only: [:edit, :new, :create, :destroy]


def index
  @recipes = Recipe.all

end

def new
  @recipe = Recipe.new
  @cookbook = Cookbook.find(params[:cookbook_id])
  @chef = Chef.find(params[:chef_id])
  #show a form
end
def create

  @chef = Chef.find(params[:chef_id])
  @cookbook = Cookbook.find(params[:cookbook_id])
  @recipe = Recipe.create(recipe_params)
  
  @cookbook.recipes << @recipe    
  redirect_to "/chefs/#{@chef.id}/cookbooks/#{@cookbook.id}"
  #chef_cookbook_path
end

def show
  @chef = Chef.find(params[:chef_id])
  @recipe = Recipe.find(params[:id])
  @cookbook = Cookbook.find(params[:cookbook_id])
end
def edit
  @chef = Chef.find(params[:chef_id])
  @recipe = Recipe.find(params[:id])
  @cookbook = Cookbook.find(params[:cookbook_id])

end
def update
  @chef = Chef.find(params[:chef_id])
  @recipe = Recipe.find(params[:id])
  @cookbook = Cookbook.find(params[:cookbook_id])
  @recipe.update(recipe_params)
  redirect_to chef_cookbook_recipes_path
end
def destroy
  @chef = Chef.find(params[:chef_id])
   @cookbook = Cookbook.find(params[:cookbook_id])
    Recipe.delete(params[:id])
    redirect_to "/chefs/#{@chef.id}/cookbooks/#{@cookbook.id}"
  end


private
def recipe_params
  params.require(:recipe).permit(:name, :instructions, :reci, :cookbook_id)
end







end