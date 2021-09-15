class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :time
      t.string :day

      t.timestamps
    end
  end
end
