class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def validate_customer
      if user_signed_in? && current_user.customer_id.nil?
        redirect_to new_customer_path, alert: "You need to tell us about your business before continuing."
      end
    end
end
