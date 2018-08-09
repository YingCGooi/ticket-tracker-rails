class RenameAssigneeToAssigneeId < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :assignee_id, :integer  
  end
end
