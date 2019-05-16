class UserCourse < ApplicationRecord
	belongs_to :user
	belongs_to :course

	USERCOURSE_ATTRS = [:user_id, :course_id, :status].freeze

	enum status: [:waiting, :registered, :cancel]
end
