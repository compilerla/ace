class FileMaker::Project < DbRecord
  class << self
    def for_member(member_id)
      query = "SELECT * FROM project INNER JOIN project_member on project.id = project_member.project_id WHERE project_member.member_id = #{member_id}"
      connection.execute(query)
    end
  end
end