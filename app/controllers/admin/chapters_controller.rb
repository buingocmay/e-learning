class Admin::ChaptersController < Admin::AdminController
	before_action :find_course, only: %i(new create edit update)
	before_action :find_chapter, only: %i(show edit update destroy)

	def show
		
	end

	def new
		@chapter = Chapter.new
		@course_options = @course.unit.courses.map { |p| [p.name, p.id] }
	end

	def create
		@chapter = Chapter.new chapter_params
		
		if @chapter.save
			create_success
  	else
  		create_fail
      render :new
  	end
	end

	def edit
		@course_options = @course.unit.courses.map { |p| [p.name, p.id] }
	end

	def update
		if @chapter.update chapter_params
  		update_success
    else
      update_fail
      render :edit
    end
	end

	def destroy
		@course = @chapter.course

    if @chapter.destroy
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

	def find_course
		@course = Course.find_by id: (params[:course_id] || params[:chapter][:course_id])

		return if @course
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy unit này"
	end

	def find_chapter
		@chapter = Chapter.find_by id: params[:id]

		return if @chapter
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy chương này"
	end

	def chapter_params
		params.require(:chapter).permit Chapter::CHAPTER_ATTRS
	end
end