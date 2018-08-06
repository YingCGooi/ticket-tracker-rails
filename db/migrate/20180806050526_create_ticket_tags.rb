class CreateTicketTags < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_tags do |t|
      t.references :ticket, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end