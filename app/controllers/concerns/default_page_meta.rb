module DefaultPageMeta
  extend ActiveSupport::Concern
  
  included do
    before_filter :set_page_defaults
  end
  
  private
  
    def set_page_defaults
      @page_title = 'Portfolio | My Portfolio Website'
      @seo_keywords = 'Justin Joseph portfolio'
    end
end