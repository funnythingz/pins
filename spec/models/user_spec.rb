require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'Create' do
    context 'default' do
      let(:user) { build(:user) }
      it {
        expect(user).to be_valid
      }
    end

    context 'upcase name is not valid' do
      let(:user_name_is_upcase) { build(:user, nickname: 'UperName') }
      it {
        expect(user_name_is_upcase).not_to be_valid
      }
    end
  end

end
