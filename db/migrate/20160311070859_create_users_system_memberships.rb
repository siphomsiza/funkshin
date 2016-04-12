class CreateUsersSystemMemberships < ActiveRecord::Migration
  def change
    create_table :users_system_memberships, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.uuid :user_id, null:  false
      t.uuid :system_user_role_id, null:  false
      t.integer :status, null:  false
      t.datetime :activated_at
      t.datetime :deactivated_at
      t.json :data, default: {}
      t.timestamps null: false
    end
    add_index :users_system_memberships, :system_user_role_id, name: "cusm_system_user_role_id"
    add_index :users_system_memberships, :status
    add_index :users_system_memberships, :user_id, unique: true
  end
end
