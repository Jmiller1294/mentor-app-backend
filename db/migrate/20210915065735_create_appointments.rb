class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :time
      t.string :day
      t.references :user, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
