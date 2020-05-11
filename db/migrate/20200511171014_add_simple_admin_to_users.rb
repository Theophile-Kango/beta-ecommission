class AddSimpleAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :simple_admin, :boolean, default: false
  end
end
