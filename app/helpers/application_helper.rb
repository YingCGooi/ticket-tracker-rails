module ApplicationHelper
  def tag_names(ticket_obj)
    tags = ticket_obj.tags
    return '-' if tags.blank?
    tags.map(&:name).join(', ')
  end

  def disable_if_logged_out
    logged_in? ? 'enabled' : 'disabled'
  end

  def assignee_name(ticket_obj)
    user = User.find_by(id: ticket_obj.assignee_id)
    return '-' if user.blank?
    user.name
  end
end
