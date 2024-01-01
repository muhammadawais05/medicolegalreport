class AddColumnsToInjuries < ActiveRecord::Migration[7.0]
  def change
    add_column :injuries, :pain_before_accident_one, :integer, default: 0
    add_column :injuries, :pain_after_accident_one, :integer, default: 0
    add_column :injuries, :accident_one_pain_now, :integer, default: 0
    add_column :injuries, :pain_before_accident_two, :integer, default: 0
    add_column :injuries, :pain_after_accident_two, :integer, default: 0
    add_column :injuries, :accident_two_pain_now, :integer, default: 0
    add_column :injuries, :pain_before_accident_three, :integer, default: 0
    add_column :injuries, :pain_after_accident_three, :integer, default: 0
    add_column :injuries, :accident_three_pain_now, :integer, default: 0
    add_column :injuries, :pain_before_accident_four, :integer, default: 0
    add_column :injuries, :pain_after_accident_four, :integer, default: 0
    add_column :injuries, :accident_four_pain_now, :integer, default: 0
    add_column :injuries, :pain_before_accident_five, :integer, default: 0
    add_column :injuries, :pain_after_accident_five, :integer, default: 0
    add_column :injuries, :accident_five_pain_now, :integer, default: 0
    add_column :injuries, :pain_before_accident_six, :integer, default: 0
    add_column :injuries, :pain_after_accident_six, :integer, default: 0
    add_column :injuries, :accident_six_pain_now, :integer, default: 0
  end
end
