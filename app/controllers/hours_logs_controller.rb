class HoursLogsController < ApplicationController
  def create
    if process_hours_data
      flash[:notice] = 'Success'
    else
      flash[:danger] = 'Failure'
    end
    redirect_to root_path
  end

  def create_row

  end

  private

  def process_hours_data
    HoursLog::TYPES.each do |log_type|
      if params['typeweeks'][log_type].present?
        return false unless valid_type_week?(params[log_type])
      end

    end

    return true
  end

  def valid_type_week?(type_week_params)
    # Todo
    true
  end
end