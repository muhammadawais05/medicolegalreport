ActiveAdmin.register Appointment do
  permitted = [:date, :solicitors_ref, :identity_proof, :examination_venue, :any_time_off_work, :report_requested_by, :other_identity_proof, :visit_after_accident, :other_hospital_visited_after_accident, :patient_id]

  controller do
    def scoped_collection
      if current_admin_user.present?
        Appointment.joins(:patient).where('patient.admin_user_id' => current_admin_user.id)
      else
        super
      end
    end
  end

  index do
    selectable_column
    column "Patient" do |appointment|
      "#{appointment.patient.first_name} #{appointment.patient.sur_name}"
    end
    column :date
    actions
  end

  filter :date

  # Remove the "New Appointment" link
  config.clear_action_items!
end
