class CreateEventRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :event_registrations do |t|
      t.string :image
      t.string :date
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
