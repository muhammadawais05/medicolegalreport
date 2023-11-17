class CreateClinicalExaminations < ActiveRecord::Migration[7.0]
  def change
    create_table :clinical_examinations do |t|
      t.boolean :neck_spasm
      t.boolean :neck_scars
      t.boolean :neck_crepitus
      t.boolean :neck_reflexes
      t.boolean :neck_sensations
      t.boolean :neck_deformities
      t.boolean :back_slr
      t.boolean :back_spasm
      t.boolean :back_scars
      t.boolean :back_reflexes
      t.boolean :back_sensations
      t.boolean :back_deformities
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
