class Skill < ApplicationRecord
  include Placeholder
  
  validates :title, presence: true
  validates :percent_utilized, presence: true
  
  after_initialize :set_default
  
  private
  
    def set_default
      self.badge ||= Placeholder.image_generator(h: '250', w: '250')
    end
end
