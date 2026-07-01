module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :authenticate_user!, only: [:create, :update, :destroy]

      def index
        render status: :ok, json: Project.ordered
      end

      def show
        project = Project.find(params[:id])
        render status: :ok, json: project
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Project not found" }
      end

      def create
        project = Project.new(project_params)
        if project.save
          render status: :created, json: project
        else
          render status: :unprocessable_entity, json: { error: project.errors.full_messages }
        end
      end

      def update
        project = Project.find(params[:id])
        if project.update(project_params)
          render status: :ok, json: project
        else
          render status: :unprocessable_entity, json: { error: project.errors.full_messages }
        end
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Project not found" }
      end

      def destroy
        project = Project.find(params[:id])
        project.destroy
        render status: :no_content, json: {}
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: "Project not found" }
      end

      private

      def project_params
        params.permit(:title, :description, :long_description, :url, :github_url,
                      :featured, :position, :problem, :solution,
                      tech_stack: [], images: [], metrics: [], engineering: [])
      end
    end
  end
end