class CreateEventsEvents < ActiveRecord::Migration
  def change
    create_table :events_events , id: :uuid, default: "uuid_generate_v4()"   do |t|
      t.string :title,null:false
      t.text :description, null:false
      t.date :event_date,null:false
      t.time :event_time,null:false
      t.uuid :user_id,null:false
      t.uuid :eventable_id, null:true
      t.string :eventable_type, null:false
      t.string :location
      t.timestamps null: false
    end
    add_index :events_events, :user_id
    add_index :events_events, [:eventable_id, :eventable_type]
    # add_foreign_key :events_events, :users_users, column: :id
  end
end
