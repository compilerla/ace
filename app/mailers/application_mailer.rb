class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@usaconservation.org'
  layout 'mailer'

  def submission_approved(submission)
    @submission = submission

    mail({
      to: submission.user.email,
      subject: "Your hours have been approved"
    })
  end
end
