class UserCoursesController < ApplicationController
	before_action :find_course, only: %i(new create)

	def new
		@list = params[:list]
		@user_course = UserCourse.new
	end

	def create
		@user_course = UserCourse.new user_course_params
		if @user_course.save
			if params[:user_course][:list] == "unit"
				@unit = @course.unit
			elsif params[:user_course][:list] == "new"
				@new_courses = Course.order_course.first(4)
			else
				most_registed = UserCourse.group('course_id').order('count_id desc')
		  		.count('id').first(4)
		  	@most_registed_courses = []
		  	most_registed.each do |course_arr|
		  		@most_registed_courses << Course.find(course_arr.first)
		  	end
			end
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