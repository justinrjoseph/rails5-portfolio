class Portfolio < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }
                                
  mount_uploader :thumbnail, PortfolioUploader
  mount_uploader :image, PortfolioUploader
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
  def self.by_position
    order('position ASC')
  end
  
  scope :ruby_on_rails, ->{ where(subtitle: 'Ruby on Rails') }
end
