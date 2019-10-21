require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :main_image }
  it { should validate_presence_of :thumb_image }
end
