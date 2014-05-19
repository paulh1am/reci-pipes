class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


helper_method :current_chef #allows to use in views and other stuff too!

def current_chef
  Chef.find(session[:chef_id]) if session[:chef_id]

end

def authorize
  redirect_to root_path if current_chef.nil?
end

end
