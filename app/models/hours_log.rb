class HoursLog < ActiveRecord::Base
  TYPES = ['service', 'training', 'vsp', 'break', 'personal_appointment', 'lunch']

  belongs_to :project
  belongs_to :user

  def self.formatted_types
    TYPES.map(&:humanize)
  end

  def submission_period
    @period ||= SubmissionPeriod.from_hours_log(self)
  end
end