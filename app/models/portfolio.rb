class Portfolio < ApplicationRecord
  after_initialize :set_defaults
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :thumbnail, presence: true
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
  scope :ruby_on_rails, ->{ where(subtitle: 'Ruby on Rails') }
  
  private
  
    def set_defaults
      self.image ||= 'http://placehold.it/600x400'
      self.thumbnail ||= 'http://placehold.it/350x200'
    end
end
