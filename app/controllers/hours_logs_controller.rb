class HoursLogsController < ApplicationController
  def create
    binding.pry
    if process_hours_data
      flash[:notice] = 'Success'
    else
      flash[:danger] = 'Failure'
    end
    redirect_to root_path
  end

  def create_row
    @week_start = Date.iso8601(params[:week_start])
  end

  private

  def process_hours_data
    params[:typeweeks].each_pair do |k, v|
      process_type_week(v)
    end

    return true
  end

  private

  def process_type_week(type_week_params)
    type_week_params[:hours].each_pair do |date, hours|
      log_attrs = {
        date: Date.iso8601(date),
        hours: hours,
        log_type: type_week_params[:log_type],
        service_type: type_week_params[:service_type]
      }

      HoursLog.create!(log_attrs)
    end

  end

end