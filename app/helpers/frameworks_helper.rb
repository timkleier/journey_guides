module FrameworksHelper
  
  # Find framework background
  def framework_background
    @framework.title.parameterize.underscore + "_bg"
  end
  
  # Construct linear framework foreground
  def construct_linear
    row_1, row_2, row_3 = "", "", ""  
    
    foreground = content_tag :div, class: "foreground" do
      table_wrapper = content_tag :table, class: "timeline_table" do
        concat content_tag :thead
        table_body = content_tag :tbody do
          if params[:mode] == "friends"
            construct_friends(row_1, row_2, row_3)
          elsif params[:mode] == "settings"
          
          else
            construct_journey(row_1, row_2, row_3)
          end
        end
        concat table_body
      end
      concat table_wrapper
    end
  end
  
  ### Helpers related to the journey
  
  # construct journey table
  def construct_journey(row_1, row_2, row_3)
    @framework.stages.includes(:resources).traverse(:depth_first).each do |stage|
      row_1 << construct_row_1(stage) if stage.depth == 1
      row_2 << "<td colspan='#{depth_1_colspan(stage)}'>#{stage.title}</td>" if stage.depth == 1
      row_3 << "<td colspan='#{depth_0_colspan(stage)}'><strong>#{stage.title}</strong></td>" if stage.depth == 0
    end
    concat raw "<tr class='resource_tr'><td><span class='map-icon map-icon-trail-walking'></span></td>#{row_1}</tr><tr><td></td>#{row_2}</tr><tr><td></td>#{row_3}</tr>"
  end
  
  # Construct first row
  def construct_row_1(stage)
    add_to_row_1 = ""
    if stage.resources.first
      stage.resources.each do |resource|
        add_to_row_1 << construct_resource(resource)
      end
    else
      add_to_row_1 << "<td></td>"
    end
    add_to_row_1
  end
  
  # Construct resource information
  def construct_resource(resource)
    content_tag :td do
      concat content_tag :i, nil, class: "small inverted circle icon link icon resource"
      concat construct_popup(resource)
    end
  end
  
  # Construct popup for resource
  def construct_popup(resource)
    popup_div = content_tag :div, class: "ui flowing popup resource_popup" do
      card = content_tag :div, class: "card" do
        concat content_tag :div, resource.title, class: "header"
        concat content_tag :div, resource.description, class: "content"
        concat link_to "View on Amazon", resource.source, class: "ui grey button", target: "_blank"
      end
      concat card
    end
  end
  
  # Calculate column span for depth 0
  def depth_0_colspan(stage)
    colspan = 0
    stage.children.includes(:resources).each do |child|
      colspan += child.resources.count unless child.resources.empty?
      colspan += 1 if child.resources.empty?
    end
    colspan
  end
  
  # Calculate column span for depth 1
  def depth_1_colspan(stage)
    stage.resources.first ? stage.resources.count : 1
  end
  
  ### Helpers related to friends
  def construct_friends(row_1, row_2, row_3)
    row_1 = "<td></td>"
    @framework.stages.includes(:users).traverse(:depth_first).each do |stage|
      row_1 << construct_friend_row_1(stage) if stage.depth == 1
      row_2 << "<td colspan='#{depth_1_colspan(stage)}'>#{stage.title}</td>" if stage.depth == 1
      row_3 << "<td colspan='#{depth_0_colspan(stage)}'><strong>#{stage.title}</strong></td>" if stage.depth == 0
    end
    concat raw "<tr class='friend_tr'><td><span class='map-icon map-icon-trail-walking'></span></td>#{row_1}</tr><tr><td></td>#{row_2}</tr><tr><td></td>#{row_3}</tr>"
  end
  
  # Construct first row
  def construct_friend_row_1(stage)
    add_to_row_1 = ""
    if stage.users.first
      stage.users.each do |user|
        add_to_row_1 << construct_user(user)
      end
    else
      add_to_row_1 << "<td></td>"
    end
    add_to_row_1
  end
  
  # Construct user information
  def construct_user(user)
    content_tag :td do
      concat content_tag :i, nil, class: "small inverted circle icon link icon user"
      concat construct_popup_user(user)
    end
  end
  
  # Construct popup for user
  def construct_popup_user(user)
    popup_div = content_tag :div, class: "ui flowing popup user_popup" do
      card = content_tag :div, class: "card" do
        concat content_tag :div, user.name, class: "header"
        concat content_tag :div, user.email, class: "content"
        concat link_to "View Profile", user_path(user), class: "ui grey button", target: "_blank"
      end
      concat card
    end
  end
end
