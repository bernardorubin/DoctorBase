class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :field5
      t.string :field6
      t.string :field7
      t.string :field8
      t.string :field9
      t.text :text_field1
      t.text :text_field2
      t.text :text_field3
      t.text :text_field4
      t.text :text_field5
      t.text :text_field6
      t.text :text_field7
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
