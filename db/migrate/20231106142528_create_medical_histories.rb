class CreateMedicalHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_histories do |t|
      t.string :type_a_pain
      t.string :similar_injuries
      t.string :past_road_accident
      t.boolean :claim_the_injuries
      t.string :what_increases_pain
      t.string :had_injection_for_pain
      t.string :has_operation_for_pain
      t.string :previous_mdeical_condition
      t.boolean :body_pain_before_accident
      t.string :history_additional_details
      t.boolean :past_similar_road_accident
      t.string :had_physiothereapy_for_pain
      t.string :body_parts_pain_before_this_accident
      t.boolean :similar_injuries_since_index_accident
      t.string :which_painkiller_is_comsuming_before_accident
      t.boolean :accident_flared_up_previous_mdeical_condition
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
