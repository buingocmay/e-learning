class Admin::StaticPagesController < Admin::AdminController
  def home
  	@user_courses = UserCourse.order_registed.all
  end
end