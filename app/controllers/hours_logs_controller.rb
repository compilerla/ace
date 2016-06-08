class HoursLogsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
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
      process_type_week(v, params[:project_id])
    end

    return true
  end

  private

  def process_type_week(type_week_params, project_id)
    ActiveRecord::Base.transaction do
      submission = Submission.create(user: current_user,
                        project_id: project_id)

      type_week_params[:hours].each_pair do |date, hours|
        log_attrs = {
          date: Date.iso8601(date),
          hours: hours,
          log_type: type_week_params[:log_type],
          service_type: type_week_params[:service_type],
          user: current_user
        }

        submission.hours_logs.create!(log_attrs)
      end

    end

  end

end