class Admin::StaticPagesController < Admin::AdminController
  def home
  	@user_courses = UserCourse.all
  end
end