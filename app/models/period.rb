class Period
  def initialize(start_date)
    @start_date = start_date
  end

  def self.from_hours_log(hours_log)
    start_date = hours_log.date.at_beginning_of_week
    Period.new(start_date)
  end
end