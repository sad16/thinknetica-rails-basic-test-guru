class FeedbackMailer < ApplicationMailer
  default to: Admin.pluck(:email),
          from: 'TestGuru Feedback <feedback@testguru.ru>',
          subject: I18n.t('feedback_mailer.subject')

  def email
    @feedback = params[:feedback]
    mail
  end
end
