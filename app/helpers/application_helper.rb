module ApplicationHelper
  def tag_names(ticket_obj)
    ticket_obj.tags.map(&:name).join(', ')
  end

  def disable_if_logged_out
    logged_in? ? 'enabled' : 'disabled'
  end
end
