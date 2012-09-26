module ApplicationHelper
  def has_children?(link)    
    unless Refinery::Page.where('show_in_menu = true').find_by_parent_id(link.id).nil?
      return true
    end
    false
  end
end