class AddPositionToExamStructures < ActiveRecord::Migration[5.2]
  def change
  	add_column :exam_structures, :position, :integer
  end
end
