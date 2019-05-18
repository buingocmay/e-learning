class CreateExamStructureDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_structure_details do |t|
    	t.integer :chapter_id
    	t.integer :number_questions
    	t.integer :exam_structure_id
    	
      t.timestamps
    end
  end
end
