class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
    	t.string :content
    	t.integer :question_id
    	t.boolean :is_correct, default: false

      t.timestamps
    end
  end
end
