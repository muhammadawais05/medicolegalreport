class AddHolidaysFromWorkToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :holidays_from_work, :string
  end
end
