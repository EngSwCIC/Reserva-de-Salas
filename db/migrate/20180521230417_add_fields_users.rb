class AddFieldsUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :registration, :string
    add_column :users, :course, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
