class ProfilesController < ApplicationController

before_action :authorize, only: [:index]

  def index
    @chef = current_chef
  end

end