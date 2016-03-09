class HoursLog < ActiveRecord::Base
  TYPES = ['service', 'training', 'vsp', 'break', 'personal_appointment', 'lunch']
  SERVICE_TYPES = ['placeholder']

  belongs_to :project
  belongs_to :user

  def self.formatted_types
    TYPES.map(&:humanize)
  end

  def self.formatted_service_types
     SERVICE_TYPES.map(&:humanize)
  end

  def period
    @period ||= Period.from_hours_log(self)
  end
end