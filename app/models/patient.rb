class Patient < ApplicationRecord
  belongs_to :admin_user
  has_one :accident, dependent: :destroy, inverse_of: :patient
  has_one :appointment, dependent: :destroy, inverse_of: :patient
  has_one :injury, dependent: :destroy, inverse_of: :patient
  has_one :treatment, dependent: :destroy, inverse_of: :patient
  has_one :medical_history, dependent: :destroy, inverse_of: :patient
  has_one :injuries_effect, dependent: :destroy, inverse_of: :patient
  has_one :opinion, dependent: :destroy, inverse_of: :patient
  has_one :clinical_examination, dependent: :destroy, inverse_of: :patient
  has_one :gp_record, dependent: :destroy, inverse_of: :patient

  [:accident, :appointment, :injury, :treatment, :medical_history, :injuries_effect, :opinion, :clinical_examination, :gp_record].each do |model|
    accepts_nested_attributes_for model, reject_if: :all_blank
  end

  validates_presence_of :email, :first_name, :sur_name

  enum form_status: { pending: 0, sent: 1, filled: 2}

  def self.ransackable_attributes(auth_object = nil)
    ["admin_user_id", "city", "created_at", "dob", "email", "first_name", "form_link", "form_status", "id", "loss_of_taste_or_smell", "ocuupation", "persistant_pain_in_chest", "phone_number", "postal_code", "shortness_of_breath", "state", "suffering_cough", "suffering_fever", "sur_name", "travelled_abroad_during_2022", "updated_at"]
  end
end
