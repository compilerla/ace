class PayPeriod < ActiveRecord::Base
  validates_presence_of :number,
                        :start_at,
                        :end_at,
                        :timesheet_due_at,
                        :pay_day_at

  def self.through_today
    where("end_at < ?", Date.today).order("end_at DESC")
  end

  def submissions
    Submission.joins(:hours_logs).where("hours_logs.date > ? AND hours_logs.date < ?", start_at, end_at).uniq
  end
end