class MemberTerm
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