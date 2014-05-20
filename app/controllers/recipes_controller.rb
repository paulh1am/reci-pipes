class RecipesController < ApplicationController

def index
  @recipes = Recipe.all

end

def new
  @recipe = Recipe.new
  @cookbook = Cookbook.find(params[:cookbook_id])
  #show a form
end
def create
  @cookbook = Cookbook.find(params[:cookbook_id])
  @recipe = Recipe.create(recipe_params)
  #params.require(:chef).permit(:name))
  @cookbook.recipes << @recipe    
  redirect_to chef_cookbook_recipe_path
end

def show
  @recipe = Recipe.find(params[:id])
  @cookbook = Cookbook.find(params[:cookbook_id])
end
def edit
  @chef = Chef.find(params[:chef_id])
  @recipe = Recipe.find(params[:id])
  @cookbook = Cookbook.find(params[:cookbook_id])

end
def update
  @recipe = Recipe.find(params[:id])
  @cookbook = Cookbook.find(params[:cookbook_id])
  @recipe.update(recipe_params)
  redirect_to chef_cookbook_recipe_path
end
def destroy
   @cookbook = Cookbook.find(params[:cookbook_id])
    Recipe.delete(params[:id])
    redirect_to chef_cookbook_recipes_path
  end


private
def recipe_params
  params.require(:recipe).permit(:name, :instructions, :reci, :cookbook_id)
end







end