class CreateExamQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_questions do |t|
    	t.integer :question_id
    	t.integer :user_exam_id
    	t.integer :user_answer

      t.timestamps
    end
  end
end
