class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        instructors = Instructor.all
        render json: instructors
    end

    def show
        render json: find_instructor
    end

    def update
        find_instructor.update!(instructor_params)
        render json: find_instructor
    end
    
    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def destroy
        find_instructor.destroy
        head :no_content
    end

    private

    def render_not_found_response
        render json: { error: "Instructor not found" }, status: :not_found
    end

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        Instructor.find(params[:id])
    end

end
