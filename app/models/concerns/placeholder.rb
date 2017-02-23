module Placeholder
  extend ActiveSupport::Concern
  
  def self.image_generator(h:, w:)
    "http://placehold.it/#{h}x#{w}"
  end
end