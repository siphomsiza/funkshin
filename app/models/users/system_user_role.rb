# == Schema Information
#
# Table name: users_system_user_roles
#
#  id               :uuid             not null, primary key
#  name             :citext           not null
#  status           :integer          default(0), not null
#  system_generated :boolean          default(FALSE), not null
#  data             :json             default({})
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  usur_name          (name)
#  usur_status        (status)
#  usur_unique_index  (name) UNIQUE
#

class Users::SystemUserRole < ActiveRecord::Base
  self.table_name = "users_system_user_roles"

  default_scope -> {order("created_at asc")}

  has_many :system_memberships,
  class_name: "Users::SystemMembership",
  foreign_key: 'system_user_role_id',
  dependent: :destroy

  attr_accessor :is_nested

  validates :name, :status,
  :presence => true

  validates :name,
  :uniqueness => true

  def role
    name
  end

  def role=(v)
    name = v
  end

  def self.default_role
    find_by :name => "SYSTEM_USER"
  end
end
