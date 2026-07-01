module Api
  module V1
    class ContactsController < ActionController::API

      def create
        message = ContactMessage.new(contact_params)

        if message.save
          SendContactEmailJob.perform_async(message.id)
          render status: :created, json: { status: "sent" }
        else
          render status: :unprocessable_entity, json: {
            error: "Validation failed",
            details: message.errors.full_messages
          }
        end
      end

      private

      def contact_params
        params.require(:contact_message).permit(:name, :email, :message, :website)
      end
    end
  end
end