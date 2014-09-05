class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :validate_customer
  protected


  def after_sign_up_path_for(resource)
    '/customers/new'
  end
end
