module FileMaker
  class MemberTerm < DbRecord
    set_table_name "member_term"

    def self.for_member(member_id)
      query = "SELECT * FROM #{table_name} WHERE member_id = #{member_id} AND start_date IS NOT NULL"
      p query
      connection.execute(query)
    end
  end
end