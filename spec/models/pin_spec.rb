require 'rails_helper'

RSpec.describe Pin, :type => :model do

  describe 'Create' do
    let(:pin) { build(:pin) }

    it {
      expect(pin).to be_valid
    }
  end

  describe 'permission' do
    let(:pin_public) { build(:pin_public) }
    it {
      expect(pin_public.is_public?).to be_truthy
    }
    it {
      expect(pin_public.is_private?).to be_falsey
    }

    let(:pin_private) { build(:pin_private) }
    it {
      expect(pin_private.is_private?).to be_truthy
    }
    it {
      expect(pin_private.is_public?).to be_falsey
    }
  end

end
