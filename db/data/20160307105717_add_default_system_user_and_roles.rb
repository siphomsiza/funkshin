class AddDefaultSystemUserAndRoles < SeedMigration::Migration
  def up
    Settings.DEFAULT_CORE_SYSTEM_USER_ROLES.each do |data|
      system_user_role = Users::SystemUserRole.create!(name: data.NAME, system_generated: true)
      puts "-> DEFAULT_CORE_SYSTEM_USER_ROLE: #{system_user_role.name}"
    end
  end

  def down

  end
end
