class AddDescriptionToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :description, :string
  end
end
