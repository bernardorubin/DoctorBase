class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :gender
      t.string :address
      t.date :last_appointment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
