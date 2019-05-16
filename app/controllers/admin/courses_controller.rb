class Admin::CoursesController < Admin::AdminController
	before_action :find_unit, only: %i(new create edit update)
	before_action :find_course, only: %i(show edit update destroy)

	def show

	end

	def new
		@course = Course.new
		@unit_options = @unit.category.units.map{|p| [p.name, p.id]}
	end

	def create
		@course = Course.new course_params

  	if @course.save
  		create_success
  	else
  		create_fail
      render :new
  	end
	end

	def edit
		@unit_options = @unit.category.units.map{|p| [p.name, p.id]}
	end

	def update
		if @course.update course_params
  		update_success
    else
      update_fail
      render :edit
    end
	end

	def destroy
		@unit = @course.unit
    if @course.destroy
      destroy_success
    else
      destroy_fail
    end
  end

	private

	%i(fail success).each do |type|
    define_method "create_#{type}" do
      @notify = {
        success: type == :success,
        message: type == :success ? "Tạo thành công" : "Tạo thất bại",
      }
    end

    define_method "update_#{type}" do
      @notify = {
        success: type == :success,
        message: type == :success ? "Cập nhật thành công" : "Cập nhật thất bại",
      }
    end

    define_method "destroy_#{type}" do
      @notify = {
        success: type == :success,
        message: type == :success ? "Xóa thành công" : "Xóa thất bại",
      }
    end
  end

	def find_unit
		@unit = Unit.find_by id: (params[:unit_id] || params[:course][:unit_id])

		return if @unit
  	flash[:danger] = "Không tìm thấy unit này"
  	redirect_to admin_categories_path
	end

	def find_course
		@course = Course.find_by id: params[:id]

		return if @course
  	flash[:danger] = "Không tìm thấy khóa học này"
  	redirect_to admin_categories_path
	end

	def course_params
    params.require(:course).permit Course::COURSE_ATTRS
  end
end