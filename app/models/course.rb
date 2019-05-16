class Course < ApplicationRecord
	belongs_to :unit
	has_many :chapters
	has_many :lessons, through: :chapters
	has_many :user_courses

	validates :name, presence: true

	COURSE_ATTRS = [:unit_id, :name].freeze
end
