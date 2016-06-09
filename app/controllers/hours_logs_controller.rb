class HoursLogsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    if process_hours_data
      flash[:success] = 'Your hours were submitted successfully'
    else
      flash[:error] = 'Uh oh. Something went wrong.'
    end
    redirect_to root_path
  end

  def create_row
    @week_start = Date.iso8601(params[:week_start])
  end

  private

  def process_hours_data
    ActiveRecord::Base.transaction do
      submission = Submission.create(user: current_user,
                        project_id: params[:project_id])

      params[:typeweeks].each_pair do |k, v|
        process_type_week(v, submission)
      end
    end

    return true
  end

  def process_type_week(type_week_params, submission)
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