class AddUsers < SeedMigration::Migration
  def up
    Users::User.delete_all
    Events::Event.delete_all
    # Create System Admin
    object = Users::User.new(Settings.SYSTEM_ADMIN_DATA.to_hash)
    object.password_confirmation = Settings.SYSTEM_ADMIN_DATA.password
    object.user_system_membership.is_nested = true
    object.skip_confirmation!
    object.save!
    object.system_membership.set_to_system_admin(true)
    puts ['id', 'firstname', 'lastname', 'email', 'password'].map{|x| {x => object.send(x)}}
    puts "Is System Admin? => #{object.system_admin?}"
    puts "\n\n"

    1.upto(5) do
      object.social_events.create!({
         :title => Faker::Name.name,
         :description => Faker::Lorem.sentence(3, true),
         :location => Faker::Address.street_address,
         :event_date => Faker::Date.forward(23),
         :event_time=> Time.now,
         :eventable_type=> "SocialEvent"
        })
      object.professional_events.create!({
         :title => Faker::Name.name,
         :description => Faker::Lorem.sentence(3, true),
         :location => Faker::Address.street_address,
         :event_date => Faker::Date.forward(23),
         :event_time=> Time.now,
         :eventable_type=> "ProfessionalEvent"
        })
    end

    # Create System User
    object = Users::User.new(Settings.NORMAL_USER_DATA.to_hash)
    object.password_confirmation = Settings.NORMAL_USER_DATA.password
    object.user_system_membership.is_nested = true
    object.skip_confirmation!
    object.save!
    object.system_membership.set_to_system_user(true)
    puts ['id', 'firstname', 'lastname', 'email', 'password'].map{|x| {x => object.send(x)}}
    puts "Is System User? => #{object.system_user?}"

    1.upto(5) do
      object.social_events.create!({
         :title => Faker::Name.name,
         :description => Faker::Lorem.sentence(3, true),
         :location => Faker::Address.street_address,
         :event_date => Faker::Date.forward(23),
         :event_time=> Time.now,
         :eventable_type=> "SocialEvent"
        })
      object.professional_events.create!({
         :title => Faker::Name.name,
         :description => Faker::Lorem.sentence(3, true),
         :location => Faker::Address.street_address,
         :event_date => Faker::Date.forward(23),
         :event_time=> Time.now,
         :eventable_type=> "ProfessionalEvent"
        })
    end

  end

  def down
    Users::User.delete_all
  end
end
