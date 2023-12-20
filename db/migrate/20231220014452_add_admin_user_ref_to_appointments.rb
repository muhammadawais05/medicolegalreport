class AddAdminUserRefToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :admin_user, null: false, foreign_key: true
  end
end
