require 'spec_helper'

describe evidencesController do
  before { sign_in FactoryGirl.create(:user) }

  describe 'GET new' do
    before { get :new}
    it { should assign_to(:point) }
    it { should render_template :new}
  end

  describe 'POST create' do
    let(:debate) { FactoryGirl.create(:debate) }
    let(:evidence) { FactoryGirl.create(:evidence) }
    let(:params) { Hash[point: { debate_id: debate.id, evidence_id: evidence.id, supporting: true }] }
    it 'should create the point' do
      expect { post :create, params }.to change{ Point.count }.by(1)
    end

    context 'after creation' do
      before { post :create, params }
      it { should redirect_to debate_url(debate) }
    end

    context 'with validation errors' do
      before { Point.any_instance.stub(:save).and_return(false) }
      before { post :create, params }
      it { should render_template :new}
    end
  end

  describe 'DELETE destroy' do
    let!(:point) { FactoryGirl.create(:point) }
    it 'should delete the point record' do
      expect { delete :destroy, id: point.id }.to change{ Point.count }.by(-1)
    end
  end
end
