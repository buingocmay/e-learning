class Admin::LessonsController < Admin::AdminController
	before_action :find_chapter, only: %i(show new create edit update)
	before_action :find_lesson, only: %i(show edit update destroy)

	def show; end

	def new
		@lesson = Lesson.new
		@chapter_options = @chapter.course.chapters.map {|p| [p.name, p.id]}
	end

	def create
		@lesson = Lesson.new lesson_params
		@chapter_options = @chapter.course.chapters.map {|p| [p.name, p.id]}
		if @lesson.save
			flash[:success] = "Tạo thành công"
			redirect_to admin_chapter_lesson_path(@chapter, @lesson)
  	else
  		flash[:danger] = "Tạo thất bại"
  		render :new
  	end
	end

	def edit
		@chapter_options = @chapter.course.chapters.map {|p| [p.name, p.id]}
	end

	def update
		if @lesson.update lesson_params
			flash[:success] = "Chỉnh sửa thành công"
			redirect_to admin_chapter_lesson_path(@chapter, @lesson)
		else
  		flash[:danger] = "Tạo thất bại"
  		render :new
  	end
	end

	def destroy
		@chapter = @lesson.chapter
		if @lesson.destroy
      destroy_success
    else
      destroy_fail
    end
	end

	private

	%i(fail success).each do |type|
    define_method "destroy_#{type}" do
      @notify = {
        success: type == :success,
        message: type == :success ? "Xóa thành công" : "Xóa thất bại",
      }
    end
  end

	def find_chapter
		@chapter = Chapter.find_by id: params[:chapter_id]

		return if @chapter
  	flash[:danger] = "Không tìm thấy chương này"
  	redirect_to admin_categories_path
	end

	def find_lesson
		@lesson = Lesson.find_by id: params[:id]

		return if @lesson
  	flash[:danger] = "Không tìm thấy bài học này"
  	redirect_to admin_categories_path
	end

	def lesson_params
		params.require(:lesson).permit Lesson::LESSON_ATTRS
	end
end