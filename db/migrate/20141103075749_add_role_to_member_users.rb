class AddRoleToMemberUsers < ActiveRecord::Migration
  def change
    add_column :member_users, :role, :string
  end
end
