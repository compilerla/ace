module FileMaker

  class Project < DbRecord
    set_table_name 'project'

    class << self
      def for_member(member_id)
        query = "SELECT * FROM #{table_name} INNER JOIN project_member on project.id = project_member.project_id WHERE project_member.member_id = #{member_id} AND project.start_date IS NOT NULL"
        p query
        connection.execute(query)
      end
    end
  end

end