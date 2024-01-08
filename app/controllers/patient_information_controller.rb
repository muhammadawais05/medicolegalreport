class PatientInformationController < ApplicationController
  before_action :find_patient

  def show
    if @patient.present?
      @injury = @patient.injury
      @opinion = @patient.opinion
      @accident = @patient.accident
      @treatment = @patient.treatment
      @appointment = @patient.appointments.last
      @medical_history = @patient.medical_history
      @injuries_effect = @patient.injuries_effect
      @clinical_examination = @patient.clinical_examination
      @gp_record = @patient.gp_record
    else
      flash[:alert] = 'No patient found.'
      redirect_to admin_patients_path
    end
  end

  def edit
    @patient_id = @patient.id if @patient
  end

  def create
    patient = Patient.find_by_id(params[:patient_id])
    return unless patient.present?

    patient.build_accident unless patient.accident.present?
    patient.appointments.build(admin_user_id: patient.admin_user_id) unless patient.appointments.present?
    patient.build_injury unless patient.injury.present?
    patient.build_treatment unless patient.treatment.present?
    patient.build_medical_history unless patient.medical_history.present?
    patient.build_opinion unless patient.opinion.present?
    patient.build_clinical_examination unless patient.clinical_examination.present?
    patient.build_gp_record unless patient.gp_record.present?

    if patient.update(permitted_params)
      patient.appointments.last.update(appointment_params)
      patient.update(form_status: 2)
      redirect_to admin_patients_path
    else
      flash[:alert] = 'Unable to edit the patient.'
      redirect_to edit_patient_information_path(patient.id)
    end
  end

  def generate_pdf
    @content = params[:html_content]

    respond_to do |format|
      format.pdf do
        pdf_data = render_to_string(
          layout: 'export_report_pdf',
          pdf: 'patient_information',
          locals: { content: @content },
          template: 'patient_information/generate_pdf',
          margin: { top: 10,
                    bottom: 10,
                    left: 30,
                    right: 30 },
          # header: { html: { template:'patient_information/header' }},
          footer: { html: { template:'patient_information/footer' }},
        )
        send_data(pdf_data, filename: 'patient_information.pdf', disposition: 'attachment')
      end
    end
  end

  private

  def find_patient
    @patient = Patient.find_by_id(params[:id])
  end

  def appointment_params
    params.require(:appointment_attributes).permit(:date, :examination_venue, :any_time_off_work, :report_requested_by,
                                                   :solicitors_ref, :visit_after_accident, :other_hospital_visited_after_accident,
                                                   :identity_proof, :other_identity_proof)
  end

  def permitted_params
    params.permit(:travelled_abroad_during_2022, :suffering_fever, :loss_of_taste_or_smell, :suffering_cough,
                  :shortness_of_breath, :persistant_pain_in_chest, :first_name, :sur_name, :dob, :city, :state, :holidays_from_work,
                  :postal_code, :ocuupation, accident_attributes: [:patient_id, :date, :vehicle, :seat_belted, :accident_victim,
                  :travelling_speed, :vehicle_category, :approximate_speed, :site_of_accident, :air_bag_deployed, :jolted_fwd_or_bwd,
                  :third_party_vehicle, :hit_the_car_interior, :body_hit_vehicle_part, :state_after_accident, :accident_scene_attendees,
                  :third_party_vehicle_speed, :able_to_exit_your_vehicle_unaided, :vehicle_fitted_with_head_restraint,
                  :description_of_nonroad_traffice_accident, :where_were_you_looking_at, mechanisms_of_injury: []], appointments_attributes:
                  [:patient_id, :date, :examination_venue, :any_time_off_work, :report_requested_by, :solicitors_ref,
                  :visit_after_accident, :other_hospital_visited_after_accident, :identity_proof, :other_identity_proof],
                  injury_attributes: [:patient_id, :injury_one_name, :injury_one_started_in, :injury_one_resolved_in,
                  :injury_one_pain_resolved, :pain_before_accident_one, :pain_after_accident_one, :accident_one_pain_now,
                  :pain_before_accident_two, :pain_after_accident_two, :accident_two_pain_now, :pain_before_accident_three,
                  :pain_after_accident_three, :accident_three_pain_now, :pain_before_accident_four, :pain_after_accident_four, :accident_four_pain_now,
                  :pain_before_accident_five, :pain_after_accident_five, :accident_five_pain_now,:pain_before_accident_six,
                  :pain_after_accident_six, :accident_six_pain_now, :injury_two_name, :injury_two_started_in, :injury_two_resolved_in,
                  :injury_two_pain_resolved, :injury_three_name, :injury_three_started_in, :injury_three_resolved_in,
                  :injury_three_pain_resolved, :injury_four_name, :injury_four_started_in, :injury_four_resolved_in,
                  :injury_four_pain_resolved, :injury_five_name, :injury_five_started_in, :injury_five_resolved_in,
                  :injury_five_pain_resolved, :injury_six_name, :injury_six_started_in, :injury_six_resolved_in,
                  :injury_six_pain_resolved], treatment_attributes: [:patient_id, :exercise, :went_to_a, :painkiller,
                  :hospital_name, :admitted_day, :attendance_date, :total_session, :symptom_comment, :no_gp_visit_reason,
                  :symptom_imporove, :treatment_comments, :need_any_operation, :date_of_attendanc, :physiotherapist_data, :total_sessions,
                  :treatment_completed, :utilizing_painkiller, :admitted_to_hospital, :further_visits_count, :painkiller_prescribe, :gp_visit_after_accident,
                  :treatment_relevant_dat, :other_mode_of_transport, :gp_visit_after_accid, :first_visit_after_accident, :mode_of_transport_to_ae,
                  :mode_of_transport_to_a, :treatment_additional_details_expert_use, :treatment_additional_details_expert_view, :symptom_imporoved,
                  :symptom_comments, :admitted_days, :painkillers, :went_to_ae, :painkiller_prescribed, :date_of_attendance, :treatment_relevant_data, ae_tests: [],
                  gp_arrangements: []], medical_history_attributes: [:type_a_pain, :similar_injuries, :past_road_accident, :claim_the_injuries,
                  :what_increases_pain, :had_injection_for_pain, :has_operation_for_pain, :previous_medical_condition,
                  :body_pain_before_accident, :history_additional_details, :past_similar_road_accident, :had_physiothereapy_for_pain,
                  :body_parts_pain_before_this_accident, :similar_injuries_since_index_accident, :which_painkiller_is_comsuming_before_accident,
                  :accident_flared_up_previous_medical_condition], injuries_effect_attributes: [:patient_id, :phased_return,
                  :injury_comments, :returned_to_work, :difficulty_resolved, :need_any_assistance, :total_holidays, :had_counseling,
                  :details_of_assistance, :difficulty_resolved_in, :further_injury_details, :psychological_symptoms_resolved,
                  :returned_to_activities, :any_difficulty_at_work, :psychological_symptoms, :suffered_psychological_sysptoms,
                  :suffer_sleeping_problem, :difficulty_in_activities, :how_long_sleeping_problem, :any_difficulty_with_house_work,
                  :any_work_adaption_for_pain, :wish_to_provide_futher_info, :activities_limited_by_symptoms, :taken_holidays,
                  :activities_restricted_by_injury, difficulties_at_home: []], opinion_attributes: [:severity_of_injuries, :diagnosis_and_causation,
                  :complications_in_future, :suffered_inconviniences, :claimant_life_expentancy, :accident_since_index_accident,
                  :consequences_of_physical_injuries, :impact_of_previous_medical_history, :effect_of_injurt_on_claimants_work_reasonable],
                  clinical_examination_attributes: [:patient_id, :neck_spasm, :neck_scars, :neck_crepitus, :neck_reflexes, :neck_sensations,
                  :neck_deformities, :back_spasm, :back_scars, :back_crepitus, :back_reflexes, :back_sensations, :back_deformities,
                  :back_slr, :other_joint_examination], gp_record_attributes: [:gp_record_provided, :pre_index_gp_record_one, :pre_index_gp_record_two,
                  :pre_index_gp_record_three, :pre_index_gp_record_four, :pre_index_gp_record_five, :post_index_gp_record_one,
                  :post_index_gp_record_two, :post_index_gp_record_three, :post_index_gp_record_four, :post_index_gp_record_five,
                  :pre_accident_hospital_record_one, :pre_accident_hospital_record_two, :pre_accident_hospital_record_three,
                  :pre_accident_hospital_record_four, :pre_accident_hospital_record_five, :post_accident_hospital_record_one,
                  :post_accident_hospital_record_two, :post_accident_hospital_record_three, :post_accident_hospital_record_four,
                  :post_accident_hospital_record_five, :physio_record_one, :physio_record_two, :physio_record_three, :physio_record_four,
                  :physio_record_five, pre_index_gp_record_images: [], post_index_gp_record_images: [], pre_accident_hospital_record_images: [],
                  post_accident_hospital_images: []])
  end
end
