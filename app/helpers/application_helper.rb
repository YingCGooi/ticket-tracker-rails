module ApplicationHelper
  def tag_names(ticket_obj)
    ticket_obj.tags.map(&:name).join(', ')
  end
end
