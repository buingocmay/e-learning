class CreateExamStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_structures do |t|
    	t.string :name
    	t.integer :course_id
    	t.integer :total_questions

      t.timestamps
    end
  end
end
