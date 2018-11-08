class AddTipoSalaToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :tipo_sala, :string
  end
end
