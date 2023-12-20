class Appointment < ApplicationRecord
  belongs_to :admin_user
  belongs_to :patient, inverse_of: :appointments

  enum identity_proof: { passport: 0, driving_license: 1, other: 2 }
  enum visit_after_accident: { ae: 0, gp: 1, physiotherapy: 2, other_hospital: 3 }

  def self.ransackable_attributes(auth_object = nil)
    ["any_time_off_work", "created_at", "date", "examination_venue", "id", "identity_proof", "other_hospital_visited_after_accident", "other_identity_proof", "patient_id", "report_requested_by", "solicitors_ref", "updated_at", "visit_after_accident"]
  end
end
