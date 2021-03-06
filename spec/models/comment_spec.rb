require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to :user }
  it { should belong_to :blog }

  it { should validate_presence_of :content }

  it { should validate_length_of(:content).is_at_least(10) }
  it { should validate_length_of(:content).is_at_most(1000) }
end
