class ExamStructure < ApplicationRecord
	belongs_to :course
	has_many :exam_structure_details
	has_many :user_exams

	accepts_nested_attributes_for :exam_structure_details, allow_destroy: true,
    reject_if: :all_blank

  EXAM_STRUCTURE_ATTRS = [:course_id, :name, :total_questions, :time,
  	exam_structure_details_attributes: %i(id chapter_id number_questions _destroy)].freeze
end
