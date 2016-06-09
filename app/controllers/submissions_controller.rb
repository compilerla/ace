class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @submission_content_partial = case params[:f]
      when 'unsubmitted'
        'unsubmitted'
      when 'unapproved'
        'unapproved'
      when 'approved'
        'approved'
      else 'unsubmitted'
        'unsubmitted'
      end

    @accumulated_hours = HoursLog.accumulated_hours_for_user(current_user)
  end
end