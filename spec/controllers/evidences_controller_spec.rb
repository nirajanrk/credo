require 'spec_helper'

describe EvidencesController do
  before { sign_in FactoryGirl.create(:user) }

  describe "DELETE destroy" do
    let!(:evidence) { FactoryGirl.create(:evidence) }

    it 'should delete the evidence' do
      expect { delete :destroy, id: evidence.id }.to change{ Evidence.count }.by(-1)
    end

    context 'after deletion' do
      before { delete :destroy, id: evidence.id }
      it { should redirect_to evidences_url }
    end
  end

  describe "GET 'index'" do
    before { get :index }
    it { should render_template :index }
    it { should assign_to(:evidences) }
  end
end
