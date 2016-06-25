# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
in_csv = CSV.open(Rails.root.join('db', 'pay_periods.csv'), { headers: true })
in_csv.each do |row|
  PayPeriod.create! number: row['Pay Period Number'],
                    start_at: DateTime.strptime(row['Pay Period Start'], '%m/%d/%y'),
                    end_at:  DateTime.strptime(row['Pay Period End'], '%m/%d/%y'),
                    timesheet_due_at:  DateTime.strptime(row['Timesheet Due'], '%m/%d/%y'),
                    pay_day_at:  DateTime.strptime(row['Pay Day'], '%m/%d/%y')
end  
in_csv.close
