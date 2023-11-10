class PatientInformationController < ApplicationController
  before_action :find_patient

  def edit
    @patient_id = @patient.id if @patient
  end

  def update
    return unless @patient.present?

    @patient.build_accident unless @patient.accident.present?
    @patient.build_appointment unless @patient.appointment.present?
    @patient.build_injury unless @patient.injury.present?
    @patient.build_treatment unless @patient.treatment.present?
    @patient.build_medical_history unless @patient.medical_history.present?
    @patient.build_opinion unless @patient.opinion.present?
    @patient.build_clinical_examination unless @patient.clinical_examination.present?

    if @patient.update(permitted_params)
      @patient.update(form_status: 2)
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
                  :postal_code, :ocuupation, accident_attributes: %i[patient_id date vehicle seat_belted accident_victim
                  travelling_speed vehicle_category approximate_speed site_of_accident air_bag_deployed jolted_fwd_or_bwd
                  third_party_vehicle hit_the_car_interior body_hit_vehicle_part state_after_accident accident_scene_attendees
                  third_party_vehicle_speed able_to_exit_your_vehicle_unaided vehicle_fitted_with_head_restraint
                  description_of_nonroad_traffice_accident where_were_you_looking_at], appointment_attributes:
                  %i[patient_id date examination_venue any_time_off_work report_requested_by solicitors_ref
                  visit_after_accident other_hospital_visited_after_accident identity_proof other_identity_proof],
                  injury_attributes: %i[patient_id injury_one_name injury_one_started_in injury_one_resolved_in
                  injury_one_pain_resolved injury_two_name injury_two_started_in injury_two_resolved_in
                  injury_two_pain_resolved injury_three_name injury_three_started_in injury_three_resolved_in
                  injury_three_pain_resolved injury_four_name injury_four_started_in injury_four_resolved_in
                  injury_four_pain_resolved injury_five_name injury_five_started_in injury_five_resolved_in
                  injury_five_pain_resolved injury_six_name injury_six_started_in injury_six_resolved_in
                  injury_six_pain_resolved], treatment_attributes: %i[patient_id ae_test exercise went_to_a painkiller
                  hospital_name admitted_day attendance_date total_session symptom_comment no_gp_visit_reason
                  symptom_imporove treatment_comments need_any_operation date_of_attendanc physiotherapist_data
                  treatment_completed utilizing_painkiller admitted_to_hospital further_visits_count painkiller_prescribe
                  treatment_relevant_dat other_mode_of_transport gp_visit_after_accid first_visit_after_accident
                  mode_of_transport_to_a treatment_additional_details_expert_use treatment_additional_details_expert_view],
                  medical_history_attributes: %i[type_a_pain similar_injuries past_road_accident claim_the_injuries
                  what_increases_pain had_injection_for_pain has_operation_for_pain previous_medical_condition
                  body_pain_before_accident history_additional_details past_similar_road_accident had_physiothereapy_for_pain
                  body_parts_pain_before_this_accident similar_injuries_since_index_accident which_painkiller_is_comsuming_before_accident
                  accident_flared_up_previous_medical_condition], injuries_effect_attributes: %i[patient_id phased_return
                  injury_comments returned_to_work difficulty_resolved need_any_assistance total_holidays had_counseling
                  details_of_assistance difficulty_resolved_in further_injury_details psychological_symptoms_resolved
                  returned_to_activities any_difficulty_at_work psychological_symptoms suffered_psychological_sysptoms
                  suffer_sleeping_problem difficulty_in_activities how_long_sleeping_problem any_difficulty_with_house_work
                  any_work_adaption_for_pain wish_to_provide_futher_info activities_limited_by_symptoms taken_holidays
                  activities_restricted_by_injury], opinion_attributes: %i[severity_of_injuries diagnosis_and_causation
                  complications_in_future suffered_inconviniences claimant_life_expentancy accident_since_index_accident
                  consequences_of_physical_injuries impact_of_previous_medical_history effect_of_injurt_on_claimants_work_reasonable],
                  clinical_examination_attributes: %i[patient_id neck_spasm neck_scars neck_crepitus neck_reflexes neck_sensations
                  neck_deformities back_spasm back_scars back_crepitus back_reflexes back_sensations back_deformities])
  end
end
