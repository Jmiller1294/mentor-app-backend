class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :date
      t.references :user, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
