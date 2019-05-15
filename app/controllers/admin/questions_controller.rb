class Admin::QuestionsController < Admin::AdminController
	before_action :find_chapter, only: %i(new create)

	def new
		@question = Question.new
		@chapter_options = @chapter.course.chapters.map {|p| [p.name, p.id]}
	end

	def create
		@question = Question.new question_params

		if @question.save
			create_success
  	else
  		create_fail
      render :new
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