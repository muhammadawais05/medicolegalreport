class PatientInformationController < ApplicationController
  before_action :find_patient

  def edit
    @patient_id = @patient.id if @patient
  end

  def update
    return unless @patient.present?

    @patient.build_accident unless @patient.accident.present?
    @patient.build_appointment unless @patient.appointment.present?

    if @patient.update(permitted_params)
      redirect_to admin_patients_path
    else
      flash[:alert] = 'Unable to edit the patient.'
      redirect_to edit_patient_information_path(params[:id])
    end
  end

  private

  def find_patient
    @patient = Patient.find_by_id(params[:id])
  end

  def permitted_params
    params.permit(:travelled_abroad_during_2022, :suffering_fever, :loss_of_taste_or_smell, :suffering_cough,
                  :shortness_of_breath, :persistant_pain_in_chest, :first_name, :sur_name, :dob, :city, :state,
                  :postal_code, :ocuupation, accident_attributes: %i[patient_id date], appointment_attributes:
                  %i[patient_id date examination_venue any_time_off_work report_requested_by solicitors_ref
                    visit_after_accident other_hospital_visited_after_accident identity_proof other_identity_proof])
  end
end
