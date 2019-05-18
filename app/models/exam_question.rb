class ExamQuestion < ApplicationRecord
	belongs_to :question
	belongs_to :user_exam
end
