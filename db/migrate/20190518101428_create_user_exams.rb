class CreateUserExams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_exams do |t|
    	t.integer :user_id
    	t.integer :exam_structure_id
    	t.integer :score
    	t.integer :user_time

      t.timestamps
    end
  end
end
