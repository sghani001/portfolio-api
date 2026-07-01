module Api
  module V1
    class ProfileController < ApplicationController
      def show
        profile = Profile.first
        if profile
          render status: :ok, json: profile
        else
          render status: :not_found, json: { error: "Profile not found" }
        end
      end

      def update
        authenticate_user!
        profile = Profile.first
        return render status: :not_found, json: { error: "Profile not found" } unless profile

        if profile.update(profile_params)
          render status: :ok, json: profile
        else
          render status: :unprocessable_entity, json: { error: profile.errors.full_messages }
        end
      end

      private

      def profile_params
        params.permit(:name, :headline, :bio, :location, :avatar_url, :resume_url,
                      :available_for_hire, :phone, :website, :contact_email,
                      :tagline, :about_extra, :leetcode_url,
                      social_links: {}, skills: [], additional_contacts: [],
                      hero_bullets: [])
      end
    end
  end
end