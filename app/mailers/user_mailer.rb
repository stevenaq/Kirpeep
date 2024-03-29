class UserMailer < ActionMailer::Base
  default from: "noreply@kirpeep.com"

  def forgot_email(user)
     @url = $domain + '/resetpassword?id=' + user.id.to_s + '&token=' + user.token.to_s
     mail(:to => user.email, :subject => 'Kirpeep password reset')
  end

  def activate_email(user)
    @url = $domain + '/activate?id=' +user.id.to_s + '&token=' + user.token.to_s
    mail(:to => user.email, :subject => 'Activate your Kirpeep account now!')
  end

  def message_email(to_user, from_user, subject, text)
    @to_user = to_user
    @from_user = from_user
    @subject = subject
    @text = text

    mail(:to => to_user.email, :subject => subject)
  end

  def report_email(listing, user)
    @listing = listing
    @user = user
    @url = $domain + '/listing/' + listing.id.to_s()
    mail(:to => 'info@kirpeep.com', :subject => user.name + ' has reported a listing')
  end

end
