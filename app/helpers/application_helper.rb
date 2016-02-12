module ApplicationHelper
    
  def show_framework?
    params[:controller] == "frameworks" and params[:action] == "show"
  end
end
