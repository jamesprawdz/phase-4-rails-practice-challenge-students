class StudentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        students = Student.all
        render json: students
    end

    def show
        render json: find_student
    end

    def update
        find_student.update!(student_params)
        render json: find_student
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def destroy
        find_student.destroy
        haed :no_content
    end

    private

    def render_not_found_response
        render json: { error: "Student not found" }, status: :not_found
    end
    
    def find_student
        Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

end
