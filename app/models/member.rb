class Member
  include Filemaker::Model

  database 'Joshua'
  layout :member 

  string :email
  string :first_name
  string :last_name
  string :id, identity: true

  has_many :project_member, source_key: :member_id

  def self.find_by_email(email)
    where(email: email.gsub('@', '\@')).first
  end
end
