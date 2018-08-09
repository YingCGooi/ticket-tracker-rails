class AddUserIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :user, index: true
  end
end
