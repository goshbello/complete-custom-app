class ApplicationController < ActionController::Base
# We want to included all the helper methods we've written in sessions_helper file in the Helpers folder to the application_controller file in the controller folder so that it will be avaialble in all controllers.
include SessionsHelper

end
