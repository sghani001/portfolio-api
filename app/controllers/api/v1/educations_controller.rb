module Api
  module V1
    class EducationsController < ApplicationController
      before_action :authenticate_user!, only: [:create, :update, :destroy]

      def index
        render status: :ok, json: Education.ordered
      end

      def show
        education = Education.find(params[:id])
        render status: :ok, json: education
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Education not found" }
      end

      def create
        education = Education.new(education_params)
        if education.save
          render status: :created, json: education
        else
          render status: :unprocessable_entity, json: { error: education.errors.full_messages }
        end
      end

      def update
        education = Education.find(params[:id])
        if education.update(education_params)
          render status: :ok, json: education
        else
          render status: :unprocessable_entity, json: { error: education.errors.full_messages }
        end
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Education not found" }
      end

      def destroy
        education = Education.find(params[:id])
        education.destroy
        render status: :no_content, json: {}
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Education not found" }
      end

      private

      def education_params
        params.permit(:school, :degree, :field, :description, :start_date, :end_date,
                      :logo_url, :position, :gpa, :duration)
      end
    end
  end
end