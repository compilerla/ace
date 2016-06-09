class HoursLog < ActiveRecord::Base
  TYPES = ['service', 'training', 'pto', 'vsp', 'lunch']

  validates :log_type,
            inclusion: { in: TYPES }

  belongs_to :project
  belongs_to :user

  def self.types_for_select
    TYPES.map{ |type| [type.humanize, type] }
  end

  def submission_period
    @period ||= SubmissionPeriod.from_hours_log(self)
  end
end