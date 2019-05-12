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
  		flash[:success] = "Tạo mới thành công"
      @categories=Category.all
  	else
  		flash[:danger] = "Có lỗi xảy ra"
  		redirect_to admin_categories_url
  	end
  end

  def edit
  end

  def update
  	if @category.update category_params
  		flash[:success] = "Cập nhật thành công"
      @categories=Category.all
    else
      flash[:danger] = "Có lỗi xảy ra"
      redirect_to admin_categories_url
    end
  end

  def destroy
    if @category.destroy
      @categories = Category.all
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Có lỗi xảy ra"
    end
  end

  private

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