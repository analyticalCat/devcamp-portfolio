class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized

  after_initialize :set_defaults

  # the pipe means only set the value if the variable at the left side of the equal sign is nil.
  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')          
  end
end
