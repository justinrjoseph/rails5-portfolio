module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to 'Log Out', destroy_user_session_path, method: :delete
    else
      (link_to 'Register', new_user_registration_path) +
      '<br>'.html_safe +
      (link_to 'Sign In', new_user_session_path)
    end
  end
  
  def source_helper
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag :p, greeting, class: 'source-greeting'
    end
  end
  
  def copyright_generator
    ITYViewTool::Renderer.copyright 'Justin Joseph', 'All rights reserved.'
  end
end
