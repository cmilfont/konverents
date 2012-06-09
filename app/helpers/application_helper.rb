module ApplicationHelper
  def active_menu_if(current_menu)
    controller_name == current_menu ? " active" : "" 
  end
end
