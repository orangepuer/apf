class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }
  scope :react, -> { where(subtitle: "React") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://placehold.it/600x400"
    self.thumb_image ||= "https://placehold.it/350x200"
  end
end
