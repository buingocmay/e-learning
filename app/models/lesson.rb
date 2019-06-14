class Lesson < ApplicationRecord
	belongs_to :chapter

	validates :name, presence: true, length: {maximum: 300}
	validates :content, presence: true

	LESSON_ATTRS = [:chapter_id, :name, :content]
end
