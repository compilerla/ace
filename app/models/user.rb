class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :member_id

  def projects
    FileMaker::Project.for_member(member_id).map do |fm_project|
      Project.new(fm_project)
    end
  end

  def outstanding_submission_periods
    # TODO
    3.times.map{SubmissionPeriod.new(Date.today)}
  end
end
