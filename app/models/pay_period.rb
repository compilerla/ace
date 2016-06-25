class PayPeriod < ActiveRecord::Base
  validates_presence_of :number,
                        :start_at,
                        :end_at,
                        :timesheet_due_at,
                        :pay_day_at
end