require 'spec_helper'

describe HomeController do
  before { sign_in FactoryGirl.create(:user) }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
end
