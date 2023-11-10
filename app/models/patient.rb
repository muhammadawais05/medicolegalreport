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

  [:accident, :appointment, :injury, :treatment, :medical_history, :injuries_effect, :opinion, :clinical_examination].each do |model|
    accepts_nested_attributes_for model, reject_if: :all_blank
  end

  validates_presence_of :email, :first_name, :sur_name

  enum form_status: { pending: 0, sent: 1, filled: 2}
end
