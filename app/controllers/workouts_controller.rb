class WorkoutsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    wrap_parameters false
    def index
        workouts = Workout.all 
        render json: workouts 
    end

    def show
      workout = Workout.find(params[:id])
      render json: workout 
    end

    # check the validity of our model when it is created, and respond appropriately:
    def create
        workout = Workout.create!(workout_params)
        render json: workout, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def summary
      workout = Workout.find(params[:id])
      render json: workout, serializer: WorkoutSummariesSerializer
    end

    def summaries
      workouts = Workout.all 
      render json: workouts, each_serializer: WorkoutSummarySerializer
    end

    private 

    def workout_params
      params.permit(:title, :year, :parti, :description, :user_url, :category, :discount, :female_director)
    end
end
