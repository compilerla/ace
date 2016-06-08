class Submission < ActiveRecord::Base
  validates_presence_of :user_id,
                        :project_id

  has_many :hours_logs
  belongs_to :user
end