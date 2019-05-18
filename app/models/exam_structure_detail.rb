class ExamStructureDetail < ApplicationRecord
	belongs_to :exam_structure
	belongs_to :chapter

	EXAM_STRUCTURE_DETAIL_ATTRS = [:exam_structure_id, :chapter_id, :number_questions].freeze
end
