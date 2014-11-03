require 'rails_helper'

RSpec.describe MyController, :type => :controller do

  describe "GET view" do
    it "returns http success" do
      get :view
      expect(response).to have_http_status(:success)
    end
  end

end
