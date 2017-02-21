class Portfolio < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :thumbnail, presence: true
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
  scope :ruby_on_rails, ->{ where(subtitle: 'Ruby on Rails') }
end
