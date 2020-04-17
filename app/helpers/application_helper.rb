module ApplicationHelper
  def login_helper class_style
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete, class: class_style
    else
      (link_to 'Register', new_user_registration_path, class: class_style) +
      ' '.html_safe +
      (link_to 'Login', new_user_session_path, class: class_style)
    end
  end

  def source_helper styles
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: styles )
    end
  end

  def copyright_generator message
    ApfViewTool::Renderer.copyright message
  end

  def nav_items
    [{url: root_path, title: 'Home'}, {url: about_me_path, title: 'About'}, {url: contact_path, title: 'Contact'},
     {url: blogs_path, title: 'Blog'}, {url: portfolios_path, title: 'Portfolio'}]
  end

  def nav_helper style, tag_type = '', tag_style = ''
    nav_link = ''

    nav_items.each do |item|
      a_tag_str = "<a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a>"
      nav_link << "#{add_tag(tag_type, tag_style)}#{a_tag_str}#{add_tag(tag_type, tag_style, '/')}"
    end

    nav_link.html_safe
  end

  def add_tag tag_type, tag_style, closing_tag = ''
    "<#{closing_tag}#{tag_type} class='#{tag_style}'>" if tag_type.present?
  end

  def active? path
    "active" if current_page? path
  end
end
