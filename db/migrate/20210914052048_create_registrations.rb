class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
