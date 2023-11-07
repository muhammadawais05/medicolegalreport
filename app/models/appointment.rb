class Appointment < ApplicationRecord
  enum identity_proof: { passport: 0, driving_license: 1, other: 2 }
  enum visit_after_accident: { ae: 0, gp: 1, physiotherapy: 2, other_hospital: 3 }
end
