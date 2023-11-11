class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.integer :ae_test
      t.integer :exercise
      t.boolean :went_to_ae
      t.string :painkillers
      t.string :hospital_name
      t.integer :admitted_days
      t.string :attendance_date
      t.integer :total_sessions
      t.string :symptom_comments
      t.string :no_gp_visit_reason
      t.boolean :symptom_imporoved
      t.string :treatment_comments
      t.boolean :need_any_operation
      t.boolean :date_of_attendance
      t.string :physiotherapist_data
      t.boolean :treatment_completed
      t.boolean :utilizing_painkiller
      t.boolean :admitted_to_hospital
      t.integer :further_visits_count
      t.boolean :painkiller_prescribed
      t.string :treatment_relevant_data
      t.string :other_mode_of_transport
      t.boolean :gp_visit_after_accident
      t.date :first_visit_after_accident
      t.boolean :mode_of_transport_to_ae
      t.string :treatment_additional_details_expert_use
      t.string :treatment_additional_details_expert_view
      t.string :gp_arrangements, array: true, default: []
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
