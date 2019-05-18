class Chapter < ApplicationRecord
	belongs_to :course
	has_many :lessons
	has_many :questions
	has_many :exam_structure_details

	validates :name, presence: true

	CHAPTER_ATTRS = [:course_id, :name]
end
