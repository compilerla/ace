class Period < ActiveRecord::Base
  def period_start
    3.weeks.ago
  end
end
