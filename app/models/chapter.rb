class Chapter < ApplicationRecord
	belongs_to :course
	has_many :lessons

	CHAPTER_ATTRS = [:course_id, :name]
end
