class Unit < ApplicationRecord
	belongs_to :category

	validates :name, presence: true, length: {maximum: 100}
end
