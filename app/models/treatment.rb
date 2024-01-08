class Treatment < ApplicationRecord
  belongs_to :patient, inverse_of: :treatment

  GP_ARRANGEMENTS = ['X-RAY' , 'MRI Scan', 'CT Scan', 'Hospital referral', 'Physiotherapy'].freeze
  AE_TESTS = ['X-RAY', 'MRI Scan', 'Ultrasound Scan', 'CT Scan','None of above', 'Examination'].freeze

  enum exercise: { physiotherapy: 0, chiro: 1, acupuncture: 2 }
  # enum ae_test: { x_ray: 0, mri_scan: 1, ultrasound_scan: 2, ct_scan: 3, none_of_above: 4, examination: 5 }
end
