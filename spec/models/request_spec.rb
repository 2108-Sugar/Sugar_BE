require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'relationships' do
    it { should belong_to :requested_by }
    it { should belong_to :lender }
    it { should belong_to :community }
  end
end
