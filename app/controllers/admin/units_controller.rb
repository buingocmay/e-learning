class Admin::UnitsController < Admin::AdminController
	before_action :find_category, only: %i(new create edit update destroy)
	before_action :find_unit, only: %i(show edit update destroy)

	def show; end

  def new
  	@unit = Unit.new
  	@category_options = Category.all.map{|p| [p.name, p.id]}
  end

  def create
		@unit = Unit.new unit_params

  	if @unit.save
      @categories=Category.all
      create_success
  	else
  		create_fail
      render :new
  	end
  end

  def edit
		@category_options = Category.all.map{|p| [p.name, p.id]}
  end

  def update
  	if @unit.update unit_params
      @categories=Category.all
      update_success
    else
      update_fail
      render :edit
    end
  end

  def destroy
    if @unit.destroy
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

  def find_unit
  	@unit = Unit.find_by id: params[:id]

  	return if @unit
  	redirect_to admin_categories_path
  	flash[:error] = "Không tìm thấy unit này"
	end

  def find_category
  	@category = Category.find_by id: params[:category_id]

  	return if @category
  	redirect_to admin_categories_path
  	flash[:error] = "Không tìm thấy danh mục này"
  end

  def unit_params
    params.require(:unit).permit Unit::UNIT_ATTRS
  end
end