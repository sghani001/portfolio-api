class SendContactEmailJob < ApplicationJob
  queue_as :mailers

  def perform(contact_message_id)
    message = ContactMessage.find_by(id: contact_message_id)
    return unless message
    return if message.sent_at.present?

    ContactMailer.new_message(message).deliver_now

    message.update!(sent_at: Time.current)
  rescue => e
    logger.error "Failed to send contact email for message ##{contact_message_id}: #{e.message}"
  end
end