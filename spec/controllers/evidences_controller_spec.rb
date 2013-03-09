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

  describe 'GET edit' do
    let(:evidence) { FactoryGirl.create(:evidence) }
    before { get :edit, id: evidence.id }
    it { should assign_to(:sources) }
  end

  describe 'PUT update' do
    let!(:evidence) { FactoryGirl.create(:evidence) }
    let(:params) { Hash[id: evidence.id, evidence: { title: 'new title' }] }

    context 'valid params' do
      before { put :update, params }
      subject { assigns(:evidence) }

      it { should be_valid }
      its(:title) { should eq 'new title' }
    end

    context 'invalid params' do
      it 'should assign_to(:sources)' do
        Evidence.any_instance.stub(:save).and_return(false)
        put :update, params
        assigns(:sources).should_not be_nil
      end
    end
  end
end
