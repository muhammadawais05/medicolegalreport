class Patient < ApplicationRecord
  belongs_to :admin_user
  has_one :accident, dependent: :destroy, inverse_of: :patient
  has_one :appointment, dependent: :destroy, inverse_of: :patient
  has_many :injuries, dependent: :destroy, inverse_of: :patient
  has_one :treatment, dependent: :destroy, inverse_of: :patient
  has_one :medical_history, dependent: :destroy, inverse_of: :patient
  has_one :injuries_effect, dependent: :destroy, inverse_of: :patient
  has_one :opinion, dependent: :destroy, inverse_of: :patient

  # accepts_nested_attributes_for :accident, reject_if: :all_blank
  # accepts_nested_attributes_for :appointment, reject_if: :all_blank
  # accepts_nested_attributes_for :injuries, reject_if: :all_blank
  # accepts_nested_attributes_for :treatment, reject_if: :all_blank
  # accepts_nested_attributes_for :medical_history, reject_if: :all_blank
  # accepts_nested_attributes_for :injuries_effect, reject_if: :all_blank
  # accepts_nested_attributes_for :opinion, reject_if: :all_blank

  [:accident, :appointment, :injuries, :treatment, :medical_history, :injuries_effect, :opinion].each do |model|
    accepts_nested_attributes_for model, reject_if: :all_blank
  end

  validates_presence_of :email, :first_name, :sur_name

  enum form_status: { pending: 0, sent: 1, filled: 2}
end
