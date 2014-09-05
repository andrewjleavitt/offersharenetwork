class DashboardController < ApplicationController
  def index
    @customer = current_user.customer
  end
end
