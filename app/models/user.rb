class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :member_id

  has_many :submissions

  def project_members
    ProjectMember.where(member_id: member_id)
  end

  def terms
    MemberTerm.where(member_id: member_id)
  end

  def member
    Member.find(member_id)
  end
end
