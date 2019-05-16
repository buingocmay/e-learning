class UserCourse < ApplicationRecord
	belongs_to :user
	belongs_to :course

	USERCOURSE_ATTRS = [:user_id, :course_id, :status].freeze

	enum status: [:waiting, :registered, :canceled]

	def status_detail
		if self.status == "waiting"
			return "Chờ phê duyệt"
		elsif self.status == "registered"
			return "Đã đăng ký"
		else
			return "Đã hủy"
		end
	end
end
