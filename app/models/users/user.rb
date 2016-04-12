# == Schema Information
#
# Table name: users_users
#
#  id                     :uuid             not null, primary key
#  firstname              :string(255)      default(""), not null
#  lastname               :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  provider               :string(255)
#  uid                    :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  data                   :json             default({})
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_users_on_email                 (email) UNIQUE
#  index_users_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_users_on_unlock_token          (unlock_token) UNIQUE
#

class Users::User < ActiveRecord::Base
  default_scope  -> {order("created_at asc")}

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :omniauthable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :timeoutable
         #:async

  validates :email,
  :presence => true,
  :uniqueness => true,
  :email => true

  def fullname
    [firstname, lastname].join(" ").presence || email
  end
  alias_method :name, :fullname

  has_many :events_events,
  class_name: 'Events::Event',
  foreign_key: 'user_id',
  dependent: :destroy
  accepts_nested_attributes_for :events_events, allow_destroy: true

  has_many :social_events,
  class_name: 'Events::SocialEvent',
  foreign_key: 'user_id',
  dependent: :destroy
  accepts_nested_attributes_for :social_events, allow_destroy: true

  has_many :professional_events,
  class_name: 'Events::ProfessionalEvent',
  foreign_key: 'user_id',
  dependent: :destroy
  accepts_nested_attributes_for :professional_events, allow_destroy: true

  has_one :system_membership,
  class_name: "Users::SystemMembership",
  foreign_key: 'user_id',
  dependent: :destroy
  accepts_nested_attributes_for :system_membership, allow_destroy: false


  def user_system_membership
    self.system_membership || self.build_system_membership
  end

  def system_admin?
    system_membership && system_membership.system_admin?
  end

  def system_user?
    system_membership && system_membership.system_user?
  end

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.firstname =  auth.info.name.split().try(:first)
      user.lastname =  auth.info.name.split().try(:last)
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
    end
    return user
  end

  def self.from_omniauth_twitter(auth)
    fullname = auth["info"]["name"].split(' ')
    first_name, last_name = fullname[0], fullname[1]
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.firstname =  first_name
      user.lastname =  last_name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = "#{auth.info.nickname}@#{auth.info.nickname}.com"
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
    end
    return user
  end

  def self.from_omniauth_linkedin(auth)
    info = auth["info"]
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.firstname =  info.first_name
      user.lastname =  info.last_name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = info.email
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
    end
    return user
  end

  def self.from_omniauth_meetup(auth)
    info = auth["info"]
    user = where(provider: auth.provider, uid: "#{auth.uid}").first_or_create do |user|
      user.firstname =  auth.info.name.split().try(:first)
      user.lastname =  auth.info.name.split().try(:last)
      user.provider = auth.provider
      user.uid = "#{auth.uid}"
      user.email = "please-change-me-#{auth.uid}@funkshin.com"
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
    end
    return user
  end

  def self.find_for_google_oauth2(auth)
    info = auth["info"]
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.firstname =  info.first_name
      user.lastname =  info.last_name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = info.email
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
    end
    return user
  end
end
