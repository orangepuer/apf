require 'rails_helper'

RSpec.describe Blog, type: :model do
  let(:blog) { FactoryBot.create(:blog) }

  it { should belong_to :topic }
  it { expect(blog).to have_many(:comments).dependent(:destroy) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
end
