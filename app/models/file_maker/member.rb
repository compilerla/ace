module FileMaker
  class Member < DbRecord
    set_table_name "member"

    def self.find_by_email(email)
      return nil unless email.present?
      
      safe_email = connection.quote(email)
      query = "SELECT * FROM #{table_name} WHERE email = #{safe_email}"
      connection.execute(query).first
    end
  end
end