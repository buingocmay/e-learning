class Admin::UnitsController < Admin::AdminController
	before_action :find_category, only: %i(new create edit update destroy)
	before_action :find_unit, only: %i(edit update destroy)

  def index
  	
  end

  def new
  	@unit = Unit.new
  	@category_options = Category.all.map{|p| [p.name, p.id]}
  end

  def create
		@unit = Unit.new unit_params

  	if @unit.save
  		flash[:success] = "Tạo thành công"
      @categories=Category.all
  	else
  		flash[:danger] = "Tạo thất bại"
  	end  	
  end

  def edit
		@category_options = Category.all.map{|p| [p.name, p.id]}
  end

  def update
  	if @unit.update unit_params
  		flash[:success] = "Cập nhật thành công"
      @categories=Category.all
    else
      render :edit
    end
  end

  def destroy
    if @unit.destroy
      @categories = Category.all
      flash[:success] = "Xóa thành công"
    else
      flash[:danger] = "Xóa thất bại"
    end
  end

  private

  def find_unit
  	@unit = Unit.find_by id: params[:id]

  	return if @unit
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy danh mục này"
	end

  def find_category
  	@category = Category.find_by id: params[:category_id]

  	return if @category
  	redirect_to admin_categories_path
  	flash[:danger] = "Không tìm thấy danh mục này"
  end

  def unit_params
    params.require(:unit).permit Unit::UNIT_ATTRS
  end
end