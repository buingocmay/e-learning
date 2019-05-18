class Admin::ExamStructuresController < Admin::AdminController
	before_action :find_course, only: %i(new create)
	before_action :find_exam_structure, only: %i(destroy)
	before_action :must_have_exam_structure_detail, only: :create
	before_action :total_questions_correct, only: :create

	def new
		@exam_structure = ExamStructure.new
		@course_options = @course.unit.courses.map { |p| [p.name, p.id] }
		@chapter_options = @course.chapters.map {|p| [p.name, p.id]}
	end

	def create
		@exam_structure = ExamStructure.new exam_structure_params

		if @exam_structure.save
			create_success
  	else
  		create_fail
      render :new
  	end
	end

	def destroy
		@course = @exam_structure.course
    
    if @exam_structure.destroy
      destroy_success
    else
      destroy_fail
    end
  end

	private

	def find_course
		@course = Course.find_by id: (params[:course_id] || params[:exam_structure][:course_id])

		return if @course
		flash[:warning] = "Không tìm thấy khóa học này"
		redirect_to admin_root_path
	end

	def find_exam_structure
		@exam_structure = ExamStructure.find_by id: params[:id]

		return if @exam_structure
		flash[:warning] = "Không tìm thấy bài kiểm tra này"
		redirect_to admin_root_path
	end

	def must_have_exam_structure_detail
		return if params[:exam_structure][:exam_structure_details_attributes]

		@exam_structure = ExamStructure.new exam_structure_params
		@course_options = @course.unit.courses.map { |p| [p.name, p.id] }
		@chapter_options = @course.chapters.map {|p| [p.name, p.id]}
		@notify = "Chưa thêm cấu trúc bài kiểm tra chi tiết!"
    render :new
	end

	def total_questions_correct
		total_numbers = 0
    params[:exam_structure][:exam_structure_details_attributes].each do |p|
      total_numbers += p[1][:number_questions].to_i
    end
    return if total_numbers == params[:exam_structure][:total_questions].to_i
    @exam_structure = ExamStructure.new exam_structure_params
		@course_options = @course.unit.courses.map { |p| [p.name, p.id] }
		@chapter_options = @course.chapters.map {|p| [p.name, p.id]}
    @notify = "Tổng số câu hỏi mỗi chương phải bằng tổng số câu hỏi của bài kiểm tra!"
    render :new
  end

	def exam_structure_params
		params.require(:exam_structure).permit ExamStructure::EXAM_STRUCTURE_ATTRS
	end

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
end
