class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_message
    def create
        signup = Signup.create!(params.permit(:camper_id, :activity_id, :time))
        render json: signup.activity, status: :created
    end

    private

    def render_invalid_message(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
