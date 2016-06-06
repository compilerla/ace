class Member
  include Filemaker::Model

  database 'JoshuaDevelopment'
  layout :member 

  string :email
  string :id, identity: true

  has_many :project_member

  def self.find_by_email(email)
    where(email: email.gsub('@', '\@')).first
  end
end
