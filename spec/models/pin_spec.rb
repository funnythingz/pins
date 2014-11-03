require 'rails_helper'

RSpec.describe Pin, :type => :model do

  describe 'Create' do
    let(:pin) { build(:pin, id: 2525) }

    it {
      expect(pin).to be_valid
    }

    it {
      expect(pin.id).to eq 2525
    }

  end

end
