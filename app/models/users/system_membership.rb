# == Schema Information
#
# Table name: users_system_memberships
#
#  id                  :uuid             not null, primary key
#  user_id             :uuid             not null
#  system_user_role_id :uuid             not null
#  status              :integer          not null
#  activated_at        :datetime
#  deactivated_at      :datetime
#  data                :json             default({})
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  cusm_system_user_role_id                   (system_user_role_id)
#  index_users_system_memberships_on_status   (status)
#  index_users_system_memberships_on_user_id  (user_id) UNIQUE
#



class Users::SystemMembership < ActiveRecord::Base
  extend Forwardable
  extend Enumerize

  self.table_name = "users_system_memberships"
  enumerize :status, in: Settings.MEMBERSHIP_STATUSES, predicates: { prefix: true }, scope: true, default: Settings.MEMBERSHIP_STATUSES.active

  default_scope -> {order("created_at asc")}

  scope :with_system_admin_role, -> {where system_user_role: Users::SystemUserRole.find_by(name: "SYSTEM_ADMININSTRATOR")}
  scope :with_user_role, -> {where system_user_role: Users::SystemUserRole.find_by(name:  "SYSTEM_USER")}

  belongs_to :user,
  class_name: "Users::User",
  foreign_key: "user_id"

  belongs_to :system_user_role,
  class_name: "Users::SystemUserRole",
  foreign_key: "system_user_role_id"

  attr_accessor :is_nested

  def_delegators :system_user_role,
  :role,
  :role=

  validates :user_id,
  presence: true,
  unless: -> {
    is_nested
  }

  validates :system_user_role_id, :status, :presence => true
  validates :user_id, :uniqueness => true, allow_nil: true
  validates :status, :inclusion => {:in => status.values}

  before_save :set_meta_data
  before_validation :set_defaults
  before_save :set_defaults


  def to_label
    [user, system_user_role, status].join("-")
  end

  def system_admin?
    system_user_role.name == "SYSTEM_ADMININSTRATOR"
  end

  def system_user?
    system_user_role.name == "SYSTEM_USER"
  end

  def set_to_system_admin(_save = true)
    self.system_user_role = Users::SystemUserRole.find_by name:  "SYSTEM_ADMININSTRATOR"
    return save if _save
    return self.system_user_role
  end

  def set_to_system_user(_save = true)
    self.system_user_role = Users::SystemUserRole.find_by name:  "SYSTEM_USER"
    return save if _save
    return self.system_user_role
  end


  private

  def set_defaults
    self[:system_user_role_id] ||= Users::SystemUserRole.default_role.try(:id)
    return true
  end

  def set_meta_data
    if status_changed? || changes.has_key?('status') || previous_changes.has_key?('status') || new_record?
      if status_active?
        self[:activated_at] = Time.current
      else
        self[:deactivated_at] = Time.current
      end
    end
    return true
  end

end
