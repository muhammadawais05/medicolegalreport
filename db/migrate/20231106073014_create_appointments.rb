class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.integer :solicitors_ref
      t.integer :identity_proof
      t.string :examination_venue
      t.boolean :any_time_off_work
      t.string :report_requested_by
      t.string :other_identity_proof
      t.integer :visit_after_accident
      t.string :other_hospital_visited_after_accident
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
