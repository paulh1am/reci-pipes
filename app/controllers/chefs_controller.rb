class ChefsController < ApplicationController

def index

end

def new
  #show a form
end

def create
new_chef = Chef.create( params.require(:chef).permit(:name))
    #(params.require(:user).permit(:username))
    redirect_to "/chefs/#{new_chef.id}"
end

def edit
@chef = Chef.find(params[:id])
#form
end

def update
edited_chef = Chefs.find(params[:id])
edited_chef.update(params.require(:chef).permit(:name))
#update 
redirect_to "/chefs/#{edited_chef.id}"
end
 def show
    @chef = Chef.find(params[:id])
    #show me user page
  end
  
  def destroy
    Chef.delete(params[:id])
    redirect_to '/chefs'
  end


end