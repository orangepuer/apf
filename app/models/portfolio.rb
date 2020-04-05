class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies

  has_one_attached :main_image
  has_one_attached :thumb_image

  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }
  scope :react, -> { where(subtitle: "React") }
  scope :by_position, -> { order("position ASC") }

  def get_main_image
    main_image.attached? ? main_image : Placeholder.image_generator(height: 600, width: 400)
  end

  def get_thumb_image
    thumb_image.attached? ? thumb_image : Placeholder.image_generator(height: 350, width: 200)
  end
end
