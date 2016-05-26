class MemberTerm
  def self.for_member(member_id)
    query = "SELECT * FROM #{table_name} WHERE member_id = #{member_id} AND start_date IS NOT NULL"
    p query
    connection.execute(query)
  end
  
  def initialize(fm_term)  
    @fm_term = fm_term
  end

 def start_date
    Date.parse(@fm_term['start_date'])
  end

  def end_date
    Date.parse(@fm_term['end_date'])
  end

  def method_missing(method_sym, *arguments, &block)
    if @fm_project.keys.include?(method_sym.to_s)
      @fm_project[method_sym.to_s]
    else
      super
    end
  end
end