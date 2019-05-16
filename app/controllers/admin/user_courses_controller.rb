class Admin::UserCoursesController < Admin::AdminController
	before_action :find_user_course, only: %i(edit update)

	def edit
	end

	def update
		if @user_course.update user_course_params
			@user_courses = UserCourse.all
			update_success
		else
      update_fail
      render :edit
    end
	end

	private

	%i(fail success).each do |type|
    define_method "update_#{type}" do
      @notify = {
        success: type == :success,
        message: type == :success ? "Cập nhật thành công" : "Cập nhật thất bại",
      }
    end
  end

	def find_user_course
		@user_course = UserCourse.find_by id: params[:id]
	end

	def user_course_params
		params.require(:user_course).permit UserCourse::USERCOURSE_ATTRS
	end

end