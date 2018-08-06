class AddFkColumnInTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :project_id, :integer
    add_foreign_key :tickets, :projects    
  end
end
