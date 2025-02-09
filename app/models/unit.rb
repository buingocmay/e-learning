class Unit < ApplicationRecord
	belongs_to :category
	has_many :courses

	validates :name, presence: true, length: {maximum: 100}

	UNIT_ATTRS = [:category_id, :name].freeze
end
