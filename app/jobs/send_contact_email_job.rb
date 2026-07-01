class SendContactEmailJob < Sidekiq::Job

  # Sidekiq job for sending contact form emails
  # This runs asynchronously to avoid slowing down the API response time
  # Uses Postmark for email delivery (card-free free tier available)

  include Sidekiq::Worker

  # Queue priority: email sending should not block API responses
  sidekiq_options queue: :mailers, retry: 3, dead: false

  def perform(contact_message_id)
    # Retrieve the contact message record from database
    # If it doesn't exist, silently exit (message may have been deleted)
    return unless (message = ContactMessage.find_by(id: contact_message_id))

    # Only send email if the message hasn't been sent yet
    return if message.sent_at.present?

    # Send email using Postmark's deliver_with_mail method
    # Configure Postmark with API key via environment variables
    deliver_result = Mail.from("portfolio@syedghani.is-a.dev")
                           .to("syedghani001@gmail.com")
                           .subject("New Contact from Portfolio")
                           .text_body("#{message.name} (#{message.email}) wrote:\n\n#{message.message}")
                           .deliver_with_resend({
                             api_key: ENV["RESEND_API_KEY"],
                             from: "portfolio@syedghani.is-a.dev",
                             to: ["syedghani001@gmail.com"]
                           })

    # Mark message as sent and store delivery ID
    message.update!(sent_at: Time.current, delivery_id: deliver_result.id)

    logger.info "Sent contact email for message ##{message.id}"
  rescue => e
    logger.error "Failed to send contact email for message ##{contact_message_id}: #{e.message}"
    # Message stays unsent so it can be retried (Sidekiq handles retries based on sidekiq_options)
  end
end