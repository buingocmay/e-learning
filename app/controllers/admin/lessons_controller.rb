class Admin::LessonsController < Admin::AdminController
	before_action :find_chapter, only: %i(show)
	before_action :find_lesson, only: %i(show)

	def new
	end

	private

	def find_chapter
		
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