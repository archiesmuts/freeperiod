class InvitationMailer < ApplicationMailer
  def invitation_instructions(user)
    @user = user
    mail(to: user.email,
        date: Time.now,
        subject: "Invitation")
  end
end
