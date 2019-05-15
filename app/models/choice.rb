class Choice < ApplicationRecord
	belongs_to :question

	CHOICE_ATTRS = [:question_id, :content, :is_correct].freeze
end
