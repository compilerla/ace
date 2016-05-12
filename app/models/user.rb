class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def projects
    
  end

  def outstanding_submission_periods
    # TODO
    3.times.map{SubmissionPeriod.new(Date.today)}
  end
end
