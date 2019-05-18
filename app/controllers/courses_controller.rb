class CoursesController < ApplicationController
	before_action :find_course, only: %i(show)
	before_action :check_signed_in, only: %i(show)
	before_action :course_registered, only: %i(show)

	def show
		
	end

	private

	def course_registered
		user_course = @course.user_courses.find_by(user_id: current_user.id)
		return if user_course && user_course.registered?
		if user_course.nil? || user_course.canceled?
			flash[:warning] = "Bạn chưa đăng ký khóa học này"
		else 
			flash[:warning] = "Bạn chưa được phê duyệt vào khóa học này"			
		end
		redirect_to root_path
	end

	def check_signed_in
		return if user_signed_in?

		flash[:warning] = "Bạn phải đăng nhập trước"
		redirect_to new_user_session_path
	end

	def find_course
		@course = Course.find_by id: params[:id]		

		return if @course
		flash[:warning] = "Không tìm thấy khóa học này"
		redirect_to root_path
	end
end