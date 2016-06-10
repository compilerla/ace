class Submission < ActiveRecord::Base
  validates_presence_of :user_id,
                        :project_id

  after_update :check_approved

  has_many :hours_logs,
           dependent: :destroy

  belongs_to :user

  scope :approved,
        ->{ where("approved_at IS NOT NULL") }

  scope :unapproved,
        ->{ where("approved_at IS NULL") }

  def period
    @period ||= SubmissionPeriod.new(hours_logs.order("date DESC").first.date)
  end

  def hours_logs_by_log_type
    hours_logs.group_by(&:log_type)
  end

  def approved?
    approved_at.present?
  end

  def hours_for_day(day_num)
    logs = hours_logs.where(date: period.start_date + day_num.send(:days))
    logs.inject(0){ |sum, log| sum + log.hours }
  end

  def hours_for_log_type(type)
    logs = hours_logs.where(log_type: type)
    logs.inject(0){ |sum, log| sum + log.hours }
  end

  private

  def check_approved
    if approved? && approved_at_was.nil? 
      ApplicationMailer.submission_approved(self).deliver_now
    end
  end

end