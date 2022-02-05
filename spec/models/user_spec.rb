require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :requested_by_requests }
    it { should have_many :lender_requests }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    # it { should validate_presence_of(:password_digest) }
    # it { should have_secure_password }
    it { should validate_presence_of(:community_id) }
  end
end
