class ContactMailer < ApplicationMailer
  def new_message(contact_message)
    @name         = contact_message.name
    @email        = contact_message.email
    @message_body = contact_message.message

    mail(
      to:       ENV.fetch("CONTACT_TO_EMAIL", "syedghani001@gmail.com"),
      from:     ENV.fetch("MAIL_FROM", "portfolio@syedghani.is-a.dev"),
      reply_to: @email,
      subject:  "📬 New contact from #{@name}"
    )
  end
end