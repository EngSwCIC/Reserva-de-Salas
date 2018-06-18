class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.time :start_time
      t.integer :status
      t.references :user
      t.references :room
      t.timestamps
    end
  end
end
