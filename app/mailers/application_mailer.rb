class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def share_form(id, email)
  	@form_id = id
  	mail(to: email, subject: 'Questionnaire Form')
  	
  end
end
