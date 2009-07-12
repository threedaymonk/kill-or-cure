# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :load_percent_complete

  def load_percent_complete
    @percent_complete = [(Vote.count * 100) / (Article.count * 3), 100].min
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
