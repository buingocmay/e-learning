class Question < ApplicationRecord
	belongs_to :chapter
	has_many :choices

	QUESTION_ATTRS = [:chapter_id, :content].freeze
end
