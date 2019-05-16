class LessonsController < ApplicationController
	before_action :find_course, only: %i(show)
	before_action :find_lesson, only: %i(show)

	def show
	end

	private

	def find_course
		@course = Course.find_by id: params[:course_id]

		return if @course
		flash[:danger] = "Không tìm thấy khóa học"
		redirect_to root_path
	end

	def find_lesson
		@lesson = Lesson.find_by id: params[:id]

		return if @lesson
		flash[:danger] = "Không tìm thấy bài học"
		redirect_to course_path(@course)
	end
end