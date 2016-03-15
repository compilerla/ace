class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @week_start = Date.today
  end
end