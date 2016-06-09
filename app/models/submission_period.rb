class SubmissionPeriod
  PERIOD_LENGTH = 1.week

  def initialize(date)
    @date = date
  end

  def self.from_hours_log(hours_log)
    start_date = hours_log.date.at_beginning_of_week
    self.new(start_date)
  end

  def submitted_for?(user, project_id)
    Submission.joins(:hours_logs).where(user: user, project_id: project_id).where("hours_logs.date > ? AND hours_logs.date < ?", start_date, end_date).any?
  end

  def start_date
    @date - @date.wday
  end

  def end_date
    start_date + PERIOD_LENGTH
  end

  def array_of_days
    days = []
    for i in 0..6
      days << (start_date + i).strftime("%A")
    end

    days
  end
end