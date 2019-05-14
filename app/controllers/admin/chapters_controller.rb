class Admin::ChaptersController < Admin::AdminController
	before_action :find_course, only: %i(new create)

	def show
		
	end

	def new
		@chapter = Chapter.new
		@course_options = @course.unit.courses.map { |p| [p.name, p.id] }
	end

	def create
		@chapter = Chapter.new chapter_params
		
		if @chapter.save
			flash[:success] = "Tạo thành công"
  	else
  		flash[:danger] = "Tạo thất bại"
  	end
	end

	private

	def find_course
		@course = Course.find_by id: (params[:course_id] || params[:chapter][:course_id])

		return if @course
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy unit này"
	end

	def chapter_params
		params.require(:chapter).permit Chapter::CHAPTER_ATTRS
	end
end