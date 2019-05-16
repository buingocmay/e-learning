class Question < ApplicationRecord
	belongs_to :chapter
	has_many :choices

	validates :content, presence: true, length: {maximum: 100}

	accepts_nested_attributes_for :choices, allow_destroy: true,
    reject_if: :all_blank

	QUESTION_ATTRS = [:chapter_id, :content, choices_attributes:
		%i(id content is_correct _destroy)].freeze
end
