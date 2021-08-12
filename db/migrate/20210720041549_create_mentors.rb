class CreateMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors do |t|
      t.string :name
      t.string :title
      t.string :field
      t.string :city
      t.string :avatar
      t.string :email
      t.string :age

      t.timestamps
    end
  end
end
