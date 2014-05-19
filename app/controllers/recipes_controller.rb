class RecipesController < ApplicationController

def index
  @recipes = Recipes.all

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
  # redirect_to "/cookbooks/#{cookbook.id}/recipes/#{@recipe.id}"
end
def edit
  @cookbook = Cookbook.find(params[:cookbook_id])
  @recipe = Recipe.find(params[:recipe_id])
end
def show
  @recipe = Recipe.find(params[:recipe_id])
  @cookbook = Cookbook.find(params[:cookbook_id])
end
def edit
  @recipe = Recipe.find(params[:recipe_id])
  @cookbook = Coobook.find(params[:cookbook_id])

end
def update
  @recipe = Recipe.find(params[:recipe_id])
  @cookbook = Cookbook.find(params[:cooknook_id])
  @recipe.update(recipe_params)
  # redirect_to "/chefs/#{@chef.id}/cookbooks/#{cookbook.id}"
end
def destroy
   @cookbook = Cookbook.find(params[:cookbook_id])
    Recipe.delete(params[:recipe_id])
    # redirect_to "/chefs/#{@chef.id}/moons"
  end


private
def recipe_params
  params.require(:recipe).permit(:name, :instructions, :reci, :cookbook_id)
end







end