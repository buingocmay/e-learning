class Lesson < ApplicationRecord
	belongs_to :chapter

	LESSON_ATTRS = [:chapter_id, :name, :content]
end
