class Admin::CategoriesController < Admin::AdminController
	before_action :find_category, only: %i(edit update destroy)

  def index
  	@categories = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new category_params

  	if @category.save
      @categories=Category.all
      create_success
  	else
  		create_fail
  	end
  end

  def edit
  end

  def update
  	if @category.update category_params
      @categories=Category.all
      update_success
    else
      update_fail
      render :edit
    end
  end

  def destroy
    if @category.destroy
      @categories = Category.all
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

  def find_category
  	@category = Category.find_by id: params[:id]

  	return if @category
  	redirect_to admin_categories_path
  	flash[:danger] = "Có lỗi xảy ra"
  end

  def category_params
    params.require(:category).permit Category::CATEGORY_ATTRS
  end
end