class CreateOpinions < ActiveRecord::Migration[7.0]
  def change
    create_table :opinions do |t|
      t.boolean :severity_of_injuries
      t.string :diagnosis_and_causation
      t.boolean :complications_in_future
      t.boolean :suffered_inconviniences
      t.boolean :claimant_life_expentancy
      t.boolean :accident_since_index_accident
      t.boolean :consequences_of_physical_injuries
      t.boolean :impact_of_previous_medical_history
      t.boolean :effect_of_injurt_on_claimants_work_reasonable
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
