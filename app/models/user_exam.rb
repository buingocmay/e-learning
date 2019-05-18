class UserExam < ApplicationRecord
	belongs_to :user
	belongs_to :exam_structure
	has_many :exam_questions

	USER_EXAM_ATTRS = [:user_id, :exam_structure_id].freeze

end
