class Admin::CoursesController < Admin::AdminController
	before_action :find_unit, only: %i(new create edit update)
	before_action :find_course, only: %i(edit update destroy)

	def show

	end

	def new
		@course = Course.new
		@unit_options = @unit.category.units.map{|p| [p.name, p.id]}
	end

	def create
		@course = Course.new course_params

  	if @course.save
  		flash[:success] = "Tạo thành công"
  	else
  		flash[:danger] = "Tạo thất bại"
  	end
	end

	def edit
		@unit_options = @unit.category.units.map{|p| [p.name, p.id]}
	end

	def update
		if @course.update course_params
  		flash[:success] = "Cập nhật thành công"
    else
      render :edit
    end
	end

	def destroy
		@unit = @course.unit
    if @course.destroy
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
  end

	private

	def find_unit
		@unit = Unit.find_by id: (params[:unit_id] || params[:course][:unit_id])

		return if @unit
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy unit này"
	end

	def find_course
		@course = Course.find_by id: params[:id]

		return if @course
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy khóa học này"
	end

	def course_params
    params.require(:course).permit Course::COURSE_ATTRS
  end
end