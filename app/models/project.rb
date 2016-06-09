class Project
  include Filemaker::Model

  database 'Joshua'
  layout :project

  string :title
  string :id, identity: true

  datetime :start_date
  datetime :end_date

  has_many :project_member, reference_key: :id, source_key: :project_id

  def method_missing(method_sym, *arguments, &block)
    if @fm_project.keys.include?(method_sym.to_s)
      @fm_project[method_sym.to_s]
    else
      super
    end
  end
end