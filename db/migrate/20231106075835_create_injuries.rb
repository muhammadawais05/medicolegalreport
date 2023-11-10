class CreateInjuries < ActiveRecord::Migration[7.0]
  def change
    create_table :injuries do |t|
      t.string :injury_one_name
      t.string :injury_one_started_in
      t.string :injury_one_resolved_in
      t.boolean :injury_one_pain_resolved
      t.string :injury_two_name
      t.string :injury_two_started_in
      t.string :injury_two_resolved_in
      t.boolean :injury_two_pain_resolved
      t.string :injury_three_name
      t.string :injury_three_started_in
      t.string :injury_three_resolved_in
      t.boolean :injury_three_pain_resolved
      t.string :injury_four_name
      t.string :injury_four_started_in
      t.string :injury_four_resolved_in
      t.boolean :injury_four_pain_resolved
      t.string :injury_five_name
      t.string :injury_five_started_in
      t.string :injury_five_resolved_in
      t.boolean :injury_five_pain_resolved
      t.string :injury_six_name
      t.string :injury_six_started_in
      t.string :injury_six_resolved_in
      t.boolean :injury_six_pain_resolved
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
