class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@usaconservation.org'
  layout 'mailer'

  def submission_approved(submission)
    mail({
      to: 'corwinstephen@gmail.com',
      subject: "Your hours have been approved"
    })
  end
end
