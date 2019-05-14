class Admin::LessonsController < Admin::AdminController
	before_action :find_chapter, only: %i(show new create)
	before_action :find_lesson, only: %i(show)

	def show
		
	end

	def new
		@lesson = Lesson.new
		@chapter_options = @chapter.course.chapters.map {|p| [p.name, p.id]}
	end

	def create
		@lesson = Lesson.new lesson_params

		if @lesson.save
			flash[:success] = "Tạo thành công"
			redirect_to admin_chapter_path(@chapter)
  	else
  		flash[:danger] = "Tạo thất bại"
  	end
	end

	private

	def find_chapter
		@chapter = Chapter.find_by id: params[:chapter_id]

		return if @chapter
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy chương này"
	end

	def find_lesson
		@lesson = Lesson.find_by id: params[:id]

		return if @lesson
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy bài học này"
	end

	def lesson_params
		params.require(:lesson).permit Lesson::LESSON_ATTRS
	end
end