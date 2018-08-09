require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  test 'ticket should not save without name' do
    ticket = Ticket.new
    assert_not ticket.save
  end
end