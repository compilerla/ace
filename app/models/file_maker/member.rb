class FileMaker::Member
  def self.find_by_email(email)
    connection = ActiveRecord::Base.connection
    safe_email = connection.quote(email)
    query = "SELECT * FROM member WHERE email = #{safe_email}"
    connection.execute(query)
  end
end