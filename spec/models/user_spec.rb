require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :requested_by_requests }
    it { should have_many :lender_requests }
  end
end
