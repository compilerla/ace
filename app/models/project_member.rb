class ProjectMember
  include Filemaker::Model

  database 'JoshuaDevelopment'
  layout :project_member

  integer :id, identity: true
  string :member_id
  string :project_id

  string :title, fm_name: 'project::title'
  
  belongs_to :project
  belongs_to :member

end
