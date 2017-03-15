module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) + ' ' +
      (link_to 'Sign In', new_user_session_path, class: style)
    else
      link_to 'Log Out', destroy_user_session_path, class: style, method: :delete
    end
  end
  
  def nav_helper(style, tag_1 = '', tag_2 = '')
    nav_links = ''
    
    nav_items.each do |nav_item|
      nav_links << tag_1
      nav_links << "<a href='#{nav_item[:url]}' "
      nav_links << "class='#{style}#{active?(nav_item[:url])}'>"
      nav_links << "#{nav_item[:text]}</a>"
      nav_links << tag_2
    end
    
    nav_links.html_safe
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
  
  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    
    if alert
      alert_generator alert
    end
  end
  
  private
  
    def nav_items
      [
        {
          url: root_path,
          text: 'Home'
        },
        {
          url: about_path,
          text: 'About'
        },
        {
          url: contact_path,
          text: 'Contact'
        },
        {
          url: blogs_path,
          text: 'Blog'
        },
        {
          url: portfolios_path,
          text: 'Portfolio'
        }
      ]
    end
  
    def active?(path)
      " active" if current_page?(path)
    end
    
    def alert_generator(msg)
      js add_gritter(msg, title: '', sticky: false)
    end
end
