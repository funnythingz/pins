require 'rails_helper'

RSpec.describe Pin, :type => :model do

  describe 'Create' do
    let(:pin) { build(:pin) }

    it {
      expect(pin).to be_valid
    }

  end

end
