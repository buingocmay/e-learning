class Course < ApplicationRecord
	belongs_to :unit
	has_many :chapters

	COURSE_ATTRS = [:unit_id, :name].freeze
end
