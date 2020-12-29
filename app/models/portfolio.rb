class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image, message: "can't be blank"

  def self.angular
    where(subtitle: 'Angular')
  end

  #another way to filter on subtitle
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}
end
