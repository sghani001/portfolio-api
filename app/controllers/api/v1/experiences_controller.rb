module Api
  module V1
    class ExperiencesController < ApplicationController
      before_action :authenticate_user!, only: [:create, :update, :destroy]

      def index
        render status: :ok, json: Experience.ordered
      end

      def show
        experience = Experience.find(params[:id])
        render status: :ok, json: experience
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Experience not found" }
      end

      def create
        experience = Experience.new(experience_params)
        if experience.save
          render status: :created, json: experience
        else
          render status: :unprocessable_entity, json: { error: experience.errors.full_messages }
        end
      end

      def update
        experience = Experience.find(params[:id])
        if experience.update(experience_params)
          render status: :ok, json: experience
        else
          render status: :unprocessable_entity, json: { error: experience.errors.full_messages }
        end
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Experience not found" }
      end

      def destroy
        experience = Experience.find(params[:id])
        experience.destroy
        render status: :no_content, json: {}
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Experience not found" }
      end

      private

      def experience_params
        params.permit(:company, :role, :description, :start_date, :end_date,
                      :current, :logo_url, :position, :company_url, :location,
                      roles: [:title, :duration], points: [])
      end
    end
  end
end