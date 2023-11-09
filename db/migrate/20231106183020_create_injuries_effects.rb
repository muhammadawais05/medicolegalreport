class CreateInjuriesEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :injuries_effects do |t|
      t.boolean :phased_return
      t.boolean :had_counseling
      t.boolean :taken_holidays
      t.integer :total_holidays
      t.string :injury_comments
      t.boolean :returned_to_work
      t.boolean :difficulty_resolved
      t.boolean :need_any_assistance
      t.string :details_of_assistance
      t.string :difficulty_resolved_in
      t.string :further_injury_details
      t.boolean :returned_to_activities
      t.boolean :any_difficulty_at_work
      t.integer :psychological_symptoms
      t.boolean :suffer_sleeping_problem
      t.string :difficulty_in_activities
      t.string :how_long_sleeping_problem
      t.boolean :any_work_adaption_for_pain
      t.boolean :wish_to_provide_futher_info
      t.boolean :acitivies_limited_by_symptoms
      t.string :activities_restricted_by_injury
      t.boolean :any_difficulty_with_house_work
      t.boolean :suffered_psychological_sysptoms
      t.boolean :psychological_symptoms_resolved
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
