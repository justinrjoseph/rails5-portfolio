class Portfolio < ApplicationRecord
  include Placeholder
  after_initialize :set_defaults
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :thumbnail, presence: true
  
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
  def self.by_position
    order('position ASC')
  end
  
  scope :ruby_on_rails, ->{ where(subtitle: 'Ruby on Rails') }
  
  private
  
    def set_defaults
      self.image ||= Placeholder.image_generator(h: '600', w: '400')
      self.thumbnail ||= Placeholder.image_generator(h: '350', w: '200')
    end
end
