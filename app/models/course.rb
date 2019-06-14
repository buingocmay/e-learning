class Course < ApplicationRecord
	belongs_to :unit
	has_many :chapters
	has_many :lessons, through: :chapters
	has_many :user_courses
	has_many :exam_structures

	validates :name, presence: true, length: {maximum: 200}

	scope :order_course, ->{order created_at: :desc}

	COURSE_ATTRS = [:unit_id, :name].freeze
end
