class MedicalHistory < ApplicationRecord
  belongs_to :patient, inverse_of: :medical_history

end
