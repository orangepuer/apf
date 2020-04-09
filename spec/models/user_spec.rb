require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { expect(user).to have_many(:comments).dependent(:destroy) }

  it { should validate_presence_of :name }
end
