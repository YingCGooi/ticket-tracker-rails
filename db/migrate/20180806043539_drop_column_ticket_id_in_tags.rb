class DropColumnTicketIdInTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :ticket_id
  end
end