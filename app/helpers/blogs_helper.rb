module BlogsHelper
  def gravatar_helper(user)
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end
  
  def markdown(txt)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
    
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      auto_link: true,
      lax_html_blocks: true
    }
    
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(txt).html_safe
  end
  
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, lang)
      CodeRay.scan(code, lang).div
    end
  end
end
