class ProjectMember
  include Filemaker::Model

  database 'JoshuaDevelopment'
  layout :project_member

  integer :id, identity: true
  integer :member_id
  integer :project_id
  
  belongs_to :project
  belongs_to :member

end
