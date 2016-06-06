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
    hours_logs.where(user: user, project_id: project_id).any?
  end
end