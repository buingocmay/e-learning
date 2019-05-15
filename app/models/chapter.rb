class Chapter < ApplicationRecord
	belongs_to :course
	has_many :lessons
	has_many :questions

	CHAPTER_ATTRS = [:course_id, :name]
end
