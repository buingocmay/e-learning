class Admin::QuestionsController < Admin::AdminController
  before_action :find_chapter, only: %i(new create)
  before_action :find_question, only: %i(destroy)
  before_action :must_have_choice, only: %i(create)
	before_action :must_choice_correct, only: %i(create)

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

  def destroy
    @chapter = @question.chapter
    if @question.destroy
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

  def find_question
    @question = Question.find_by id: params[:id]

    return if @question
    redirect_to admin_categories_path
    flash[:warning] = "Không tìm thấy câu hỏi này"
  end

	def find_chapter
		@chapter = Chapter.find_by id: params[:chapter_id]

		return if @chapter
  	redirect_to admin_categories_path
  	flash[:warning] = "Không tìm thấy bài học này"
	end

  def must_have_choice
    params[:question][:choices_attributes].each do |p|
      return if p[1][:is_correct] == "1"
    end
    @question = Question.new question_params
    @chapter_options = @chapter.course.chapters.map {|p| [p.name, p.id]}
    @notify = "Chưa chọn đáp án đúng!"
    render :new
  end

  def must_choice_correct
    return if params[:question][:choices_attributes]
    flash[:warning] = "Câu hỏi phải có lựa chọn"
    redirect_to admin_chapter_path(@chapter)
  end

	def question_params
		params.require(:question).permit Question::QUESTION_ATTRS
	end
end