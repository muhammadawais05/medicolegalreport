class PatientMailer < ApplicationMailer
  default from: 'kmoholkar@gmail.com'

  def send_patient_form
    @patient = params[:patient]
    mail(to: @patient.email, subject: 'Fill the Patient form')
  end
end
