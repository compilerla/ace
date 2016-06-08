class Submission < ActiveRecord::Base
  validates_presence_of :user_id,
                        :project_id

  has_many :hours_logs
  belongs_to :user

  scope :approved,
        ->{ where("approved IS NOT NULL") }

  scope :unapproved,
        ->{ where("approved IS NULL") }

  def period
    @period ||= SubmissionPeriod.new(hours_logs.order("date DESC").first.date)
  end
end