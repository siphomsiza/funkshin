class CreateUsersSystemUserRoles < ActiveRecord::Migration
  def change
    enable_extension("citext")
    create_table :users_system_user_roles , id: :uuid, default: "uuid_generate_v4()" do |t|
      t.citext :name, null:  false
      t.integer :status, null:  false, default:0
      t.boolean :system_generated, null:false, default: false
      t.json :data, default: {}
      t.timestamps null: false
    end
    add_index :users_system_user_roles, :name, name: "usur_name"
    add_index :users_system_user_roles, :status, name: "usur_status"
    add_index :users_system_user_roles, [:name], name: "usur_unique_index", unique: true
  end
end
