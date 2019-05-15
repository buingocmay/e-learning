class Admin::QuestionsController < Admin::AdminController
	before_action :find_chapter, only: %i(new create)

	def new
		@question = Question.new
		@chapter_options = @chapter.course.chapters.map {|p| [p.name, p.id]}
	end

	def create
		@question = Question.new question_params

		if @question.save
			flash[:success] = "Tạo thành công"
  	else
  		flash[:danger] = "Tạo thất bại"
  	end
	end

	private

	def find_chapter
		@chapter = Chapter.find_by id: params[:chapter_id]

		return if @chapter
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy bài học này"
	end

	def question_params
		params.require(:question).permit Question::QUESTION_ATTRS
	end
end