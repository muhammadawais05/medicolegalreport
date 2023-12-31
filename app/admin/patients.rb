ActiveAdmin.register Patient do
  Formtastic::FormBuilder.perform_browser_validations = true
  # before_action :get_admin_users

  permit_params :email, :first_name, :sur_name, :phone_number

  index do
    selectable_column
    column :id
    column :first_name
    column :sur_name
    column :form_status
    actions
    actions defaults: false do |patient|
      # Only show the details button when form_status is "filled"
      if patient.form_status == 'filled'
        link_to 'Report', patient_information_path(patient.id), class: 'member_link'
      end
    end
  end

  filter :first_name
  filter :sur_name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email, input_html: {required: true}
      f.input :first_name, input_html: {required: true}
      f.input :sur_name, input_html: {required: true}
      f.input :phone_number, input_html: {required: true}
    end
    f.actions
  end

  controller do
    def create
      @patient = current_admin_user.patients.new(create_params)
      if @patient.save
        PatientMailer.with(patient: @patient).send_patient_form.deliver_now
        @patient.update(form_status: 1)
        redirect_to admin_patients_path
      else
        render :new_admin_patient_path
      end
    end

    private
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end

    def create_params
      params.require(:patient).permit(:email, :first_name, :sur_name, :phone_number).merge(admin_user_id: current_admin_user.id)
    end

    # def get_admin_users
    #   @admin_users = AdminUser.all
    # end
  end
end
