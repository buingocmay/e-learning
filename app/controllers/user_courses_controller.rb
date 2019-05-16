class UserCoursesController < ApplicationController
	before_action :find_course, only: %i(new create)

	def new
		@user_course = UserCourse.new
	end

	def create
		@user_course = UserCourse.new user_course_params

		if @user_course.save
			@unit = @course.unit
			create_success
		else
  		create_fail
  	end
	end

	private

	%i(fail success).each do |type|
    define_method "create_#{type}" do
      @notify = {
        success: type == :success,
        message: type == :success ? "Đã gửi đăng ký" : "Không đăng ký được",
      }
    end
  end

	def find_course
		@course = Course.find_by id: (params[:course_id] || params[:user_course][:course_id])
	end

	def user_course_params
		params.require(:user_course).permit UserCourse::USERCOURSE_ATTRS
	end
end