class Category < ApplicationRecord
	has_many :units

	validates :name, presence: true, length: {maximum: 100}, uniqueness: true

	CATEGORY_ATTRS = [:name].freeze
end
