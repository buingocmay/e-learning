class Choice < ApplicationRecord
	belongs_to :question

	validates :content, presence: true, length: {maximum: 1000}

	CHOICE_ATTRS = [:question_id, :content, :is_correct].freeze
end
