# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery 
  
  before_filter :authenticate, :except => %w(index show)

  def login
    authenticate and redirect_to root_path
  end

  def logout
    session[:admin] = false
    reset_session
    redirect_to root_path
  end

  def authenticate
    authenticate_or_request_with_http_basic("Amministrazione") do |username, password|
      username == 'admin' && password == 'vuotoaperdere' && session[:admin] = true
    end
  end
  protected :authenticate
end
