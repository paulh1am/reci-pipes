class ProfilesController < ApplicationController

  def index
    @chef = current_chef
  end

end
