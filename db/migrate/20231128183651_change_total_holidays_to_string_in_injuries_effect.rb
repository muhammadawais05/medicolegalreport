class ChangeTotalHolidaysToStringInInjuriesEffect < ActiveRecord::Migration[7.0]
  def change
    change_column :injuries_effects, :total_holidays, :string
  end
end
