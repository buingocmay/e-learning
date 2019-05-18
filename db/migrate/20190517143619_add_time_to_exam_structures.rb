class AddTimeToExamStructures < ActiveRecord::Migration[5.2]
  def change
  	add_column :exam_structures, :time, :integer
  end
end
