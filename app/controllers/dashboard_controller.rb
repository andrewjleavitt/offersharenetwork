class DashboardController < ApplicationController
  before_filter :validate_customer

  def index
    @customer = current_user.customer
  end
end
