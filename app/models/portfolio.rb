class Portfolio < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :thumbnail, presence: true
end
