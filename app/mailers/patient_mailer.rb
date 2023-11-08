class PatientMailer < ApplicationMailer

  def send_patient_form
    @patient = params[:patient]
    mail(to: @patient.email, subject: 'Fill the Patient form')
  end
end
