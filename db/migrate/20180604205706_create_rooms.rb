class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
    	t.string :name
    	t.string :location
    	
      t.timestamps
    end
  end
end
