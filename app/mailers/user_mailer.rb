class UserMailer < ApplicationMailer
    def new_user_email(receiver, sender)
        @sender = sender
        @receiver = receiver

        mail(to: 'kelsey.shiba@gmail.com',
            subject: 'Please Sign Up',
            reply_to: @sender.email
        )
    end
end
