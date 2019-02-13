class TestPassageMailer < ApplicationMailer
  def result_email(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test

    mail(to: @user.email, subject: I18n.t('test_passage_mailer.subject', title: @test.title))
  end
end
