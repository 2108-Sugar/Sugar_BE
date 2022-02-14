require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'relationships' do
    it { should belong_to :requested_by }
    it { should belong_to(:lender).optional }
    it { should belong_to :community }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:details) }
    it { should validate_presence_of(:borrow_date) }
    it { should validate_presence_of(:return_date) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:item_category) }
    it { should validate_presence_of(:requested_by_id) }
    it { should validate_presence_of(:community_id) }
  end
end
