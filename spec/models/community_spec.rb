require 'rails_helper'

RSpec.describe Community, type: :model do
  describe 'relationships' do
    it { should have_many :requests }
    it { should have_many :users }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
