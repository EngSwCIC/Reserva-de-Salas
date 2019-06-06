class AddStudentsToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :students, :integer
  end
end
