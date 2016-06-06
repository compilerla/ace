class MemberTerm
  include Filemaker::Model

  database 'JoshuaDevelopment'

  layout :member_term

  string :member_id

  datetime :start_date
  datetime :end_date
end