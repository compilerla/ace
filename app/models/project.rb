class Project
  # Initialized with an instance of FileMaker::Project
  def initialize(fm_project)
    @fm_project = fm_project
  end

  def submission_periods_for_user(user)
    term = user.terms.first

    intersect_start_date = [start_date, term.start_date].max
    intersect_end_date = [end_date, term.end_date].min
    iterator_date = intersect_start_date

    periods = []
    while(iterator_date < intersect_end_date)
      periods << SubmissionPeriod.new(iterator_date)
      iterator_date += 1.week
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