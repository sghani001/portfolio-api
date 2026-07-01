class ContactMailer < ApplicationMailer
  def new_message(contact_message)
    @name = contact_message.name
    @email = contact_message.email
    @message_body = contact_message.message

    mail(
      to: "syedghani001@gmail.com",
      from: "portfolio@syedghani.is-a.dev",
      reply_to: @email,
      subject: "New contact from #{@name}"
    )
  end
end