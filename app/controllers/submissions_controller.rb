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

  def destroy
    submission = Submission.find(params[:id])
    if submission.destroy
      flash[:success] = "You successfuly unsubmitted your hours"
    else
      flash[:error] = "Uh oh. Something went wrong."
    end

    redirect_to root_path
  end
end