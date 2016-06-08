class SubmissionPeriod
  PERIOD_LENGTH = 1.week

  def initialize(start_date)
    @start_date = start_date
  end

  def self.from_hours_log(hours_log)
    start_date = hours_log.date.at_beginning_of_week
    self.new(start_date)
  end

  def period_start
    @start_date
  end

  def hours_logs
    HoursLog.where("date > ? AND date < ?", @start_date, @start_date + PERIOD_LENGTH)
  end

  def submitted_for?(user, project_id)
    false
    # hours_logs.where(user: user, project_id: project_id).any?
  end

  def start_date
    @start_date - @start_date.wday
  end

  def end_date
    @start_date + PERIOD_LENGTH
  end

  def array_of_days
    days = []
    for i in 0..6
      days << (@start_date + i).strftime("%A")
    end

    days
  end
end