class DashboardController < ApplicationController
  def index
    @week_start = Date.today
  end
end