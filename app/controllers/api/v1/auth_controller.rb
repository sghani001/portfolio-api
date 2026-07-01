module Api
  module V1
    class AuthController < ApplicationController
      def sign_in
        user = User.find_by(email: params[:email])

        if user&.valid_password?(params[:password])
          token = Warden::JWTAuth::UserEncoder.new.call(
            user, :user, nil
          ).first

          render status: :ok, json: { token: token, email: user.email }
        else
          render status: :unauthorized, json: { error: "Invalid email or password" }
        end
      end

      def me
        authenticate_user!
        render status: :ok, json: { user: { email: current_user.email } }
      end
    end
  end
end