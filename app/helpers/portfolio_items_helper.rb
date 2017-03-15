module PortfolioItemsHelper
  def image_generator(h:, w:)
    "http://placehold.it/#{h}x#{w}"
  end
  
  def portfolio_img(img, type)
    if img.model.image? || img.model.thumbnail?
      img
    elsif type == 'thumbnail'
      image_generator h: '350', w: '200'
    elsif type == 'main'
      image_generator h: '600', w: '400'
    end
  end
end
