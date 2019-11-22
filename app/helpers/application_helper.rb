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

  def source_helper
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greeting, class: 'source-greeting' )
    end
  end

  def copyright_generator message
    ApfViewTool::Renderer.copyright message
  end
end
