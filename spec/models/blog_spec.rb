require 'rails_helper'

RSpec.describe Blog, type: :model do
  it { should belong_to :topic }
  it { should have_many :comments }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
end
