class Course < ApplicationRecord
	belongs_to :unit
	has_many :chapters
	has_many :lessons, through: :chapters

	validates :name, presence: true

	COURSE_ATTRS = [:unit_id, :name].freeze
end
