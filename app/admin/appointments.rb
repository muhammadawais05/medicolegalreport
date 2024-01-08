ActiveAdmin.register Appointment do
  permitted = [:date, :solicitors_ref, :identity_proof, :examination_venue, :any_time_off_work, :report_requested_by, :other_identity_proof, :visit_after_accident, :other_hospital_visited_after_accident, :patient_id]

  index do
    selectable_column
    column "Patient" do |appointment|
      "#{appointment.patient.first_name} #{appointment.patient.sur_name}"
    end
    column :date
    actions
  end

  filter :date

  form do |f|
    f.inputs do
      f.input :patient, as: :select, collection: Patient.all.map { |p| ["#{p.first_name} #{p.sur_name}", p.id] }, input_html: {required: true}
      f.input :date, as: :datepicker, input_html: {required: true}
      f.input :solicitors_ref, input_html: {required: true}
      f.input :examination_venue, input_html: {required: true}
      f.input :report_requested_by, input_html: {required: true}
    end
    f.actions
  end

  controller do
    def create
      @appointment = current_admin_user.appointments.new(create_params)
      if @appointment.save
        redirect_to admin_appointments_path
      else
        render new_admin_appointment_path
      end
    end

    private

    def scoped_collection
      if current_admin_user.present?
        Appointment.joins(:patient).where(admin_user_id: current_admin_user.id)
      else
        super
      end
    end

    def create_params
      params.require(:appointment).permit(:patient_id, :date, :solicitors_ref, :examination_venue, :report_requested_by).merge(admin_user_id: current_admin_user.id)
    end
  end

  # Remove the "New Appointment" link
  # config.clear_action_items!
end
