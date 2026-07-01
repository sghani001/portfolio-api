class ApplicationController < ActionController::API
  def authenticate_user!
    token = request.headers["Authorization"]&.split(" ")&.last
    return render status: :unauthorized, json: { error: "Authorization required" } unless token

    begin
      payload, _ = JWT.decode(
        token,
        ENV.fetch("DEVISE_JWT_SECRET", Rails.application.credentials.secret_key_base),
        true,
        algorithm: "HS256"
      )
      @current_user = User.find(payload["sub"])
    rescue JWT::DecodeError, JWT::ExpiredSignature => e
      render status: :unauthorized, json: { error: e.message }
    rescue ActiveRecord::RecordNotFound
      render status: :unauthorized, json: { error: "User not found" }
    end
  end

  def current_user
    @current_user
  end
end