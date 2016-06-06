class ProjectMember
  include Filemaker::Model

  database 'JoshuaDevelopment'
  layout :project_member

  integer :id, identity: true
  string  :member_id
  string  :project_id

  string    :title
  datetime  :start_date
  datetime  :end_date

  belongs_to :project
  belongs_to :member

  def submission_periods_for_user(user)
    term = user.terms.first

    return [] unless term

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

end
