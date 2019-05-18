class ExamStructuresController < ApplicationController
	before_action :find_exam_structure, only: %i(show)
	before_action :find_course, only: %i(show)

	def show
		
	end

	private

	def find_course
		@course = Course.find_by id: params[:course_id]

		return if @course
		flash[:danger] = "Không tìm thấy khóa học"
		redirect_to root_path
	end

	def find_exam_structure
		@exam_structure = ExamStructure.find_by id: params[:id]		

		return if @exam_structure
		flash[:danger] = "Không tìm thấy khóa học"
		redirect_to course_path(@course)
	end
end