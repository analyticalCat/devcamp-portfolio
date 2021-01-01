class Portfolio < ApplicationRecord
  has_many :technologies

  #it's important to follow this type of pattern
  accepts_nested_attributes_for :technologies, 
                                reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image, message: "can't be blank"

  def self.angular
    where(subtitle: 'Angular')
  end

  #another way to filter on subtitle
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}

  #after_initialize happens after the "new" method in the controller.  after_create happens after the "create" method in the controller class
  after_initialize :set_defaults

  # the pipe means only set the value if the variable at the left side of the equal sign is nil.
  def set_defaults

    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
