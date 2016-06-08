class Submission < ActiveRecord::Base
  validates_presence_of :user_id,
                        :project_id

  has_many :hours_logs,
           dependent: :destroy

  belongs_to :user

  scope :approved,
        ->{ where("approved IS NOT NULL") }

  scope :unapproved,
        ->{ where("approved IS NULL") }

  def period
    @period ||= SubmissionPeriod.new(hours_logs.order("date DESC").first.date)
  end

  def hours_logs_by_log_type
    hours_logs.group_by(&:log_type)
  end

end