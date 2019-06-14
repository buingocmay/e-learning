class StaticPagesController < ApplicationController
  def home
  	@new_courses = Course.order_course.first(4)
  	most_registed = UserCourse.group('course_id').order('count_id desc')
  		.count('id').first(4)
  	@most_registed_courses = []
  	most_registed.each do |course_arr|
  		@most_registed_courses << Course.find(course_arr.first)
  	end
  end
end