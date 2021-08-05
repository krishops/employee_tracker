class AddRoleToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column(:employees, :role, :string)
  end
end
