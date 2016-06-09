class HoursLog < ActiveRecord::Base
  TYPES = ['service', 'training', 'pto', 'vsp', 'lunch']

  validates :log_type,
            inclusion: { in: TYPES }

  belongs_to :submission
  belongs_to :user

  def self.types_for_select
    TYPES.map do |type|
      if ['pto', 'vsp'].include?(type)
        type.upcase
      else
        [type.humanize, type]
      end
    end
  end

  def submission_period
    @period ||= SubmissionPeriod.from_hours_log(self)
  end

  def self.accumulated_hours_for_user(user)
    HoursLog.joins(:submission).where("submissions.approved_at IS NOT NULL").where("submissions.user_id = ?", user.id).inject(0){|sum, hours_log| sum + hours_log.hours }
  end
end