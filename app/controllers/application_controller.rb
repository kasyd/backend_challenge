# This is the base controller for all the controllers in the application.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
