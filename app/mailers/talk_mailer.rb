class TalkMailer < ActionMailer::Base
  default from: 'no-reply@rubyjax.herokuapp.com'

  def new_talk(talk)
    @talk = talk
    mail to: ['thibaut@milesrock.com', 'scourtois@cubyx.fr', 'sylvain.abelard+rails@gmail.com'],
         from: 'no-reply@rubyjax.herokuapp.com',
         reply_to: talk.speaker_email,
         subject: "[RubyJax] New Talk: #{talk.title}"
  end
end
