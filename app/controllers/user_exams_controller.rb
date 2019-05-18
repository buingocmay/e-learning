class UserExamsController < ApplicationController
	before_action :find_exam_structure, only: %i(create)
	before_action :find_user_exam, only: %i(show)

	def show; end

	def new; end

	def create
		@user_exam = UserExam.new user_exam_params

		if @user_exam.save
			details = @exam_structure.exam_structure_details
			details.sample(details.count).each do |detail|
				detail.chapter.questions.sample(detail.number_questions).each do |question|
					@user_exam.exam_questions.create(question_id: question.id)
				end
			end
			redirect_to @user_exam
		else
			flash[:warning] = "Có lỗi xảy ra"
			redirect_to course_exam_structure_path(@exam_structure.course, @exam_structure)
		end
	end

	def submit_exam
		correct = 0
		params[:arrAnswer].each do |user_answer|
			exam_question = ExamQuestion.find_by id: user_answer[1][0].to_i
			@user_exam = exam_question.user_exam
			choice = Choice.find_by id: user_answer[1][1].to_i
			exam_question.update user_answer: choice.id
			correct += 1 if choice.is_correct
		end
		score = correct*100/(@user_exam.exam_questions.count).to_i
		
		@user_exam.update score: score
		redirect_to course_exam_structure_path(@user_exam.exam_structure.course, @user_exam.exam_structure)
	end

	private

	def find_exam_structure
		@exam_structure = ExamStructure.find_by params[:exam_structure_id]
	end

	def find_user_exam
		@user_exam = UserExam.find_by id: params[:id]
		
	end

	def user_exam_params
		params.require(:user_exam).permit UserExam::USER_EXAM_ATTRS
	end

end