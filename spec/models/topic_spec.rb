require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_many :blogs }

  it { should validate_presence_of :title }
end
