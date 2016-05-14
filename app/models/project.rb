class ::Project
  # Initialized with an instance of FileMaker::Project
  def initialize(fm_project)
    @fm_project = fm_project
  end

  def submission_periods
    date = start_date
    periods = []
    while(date < end_date)
      periods << SubmissionPeriod.new(date)
      date += 1.week
    end

    periods
  end

  def start_date
    Date.parse(@fm_project['start_date'])
  end

  def end_date
    Date.parse(@fm_project['end_date'])
  end

  def method_missing(method_sym, *arguments, &block)
    if @fm_project.keys.include?(method_sym.to_s)
      @fm_project[method_sym.to_s]
    else
      super
    end
  end
end