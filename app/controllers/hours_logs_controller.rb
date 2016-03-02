class HoursLogsController < ApplicationController
  def create
    flash[:notice] = "Yay"
    redirect_to root_path
  end

  def create_row

  end
end