class UserMailer < ApplicationMailer
    def new_user_email(receiver, sender, message)
        @sender = sender
        @receiver = receiver
        @message = message

        mail(to: 'kelsey.shiba@gmail.com',
            subject: 'Please Sign Up',
            reply_to: @sender.email
        )
    end
end
