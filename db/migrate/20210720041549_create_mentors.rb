class CreateMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors do |t|
      t.string :name
      t.string :title
      t.string :field

      t.timestamps
    end
  end
end
