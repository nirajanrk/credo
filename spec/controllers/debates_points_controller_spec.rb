require 'spec_helper'

describe DebatesPointsController do
  before { sign_in FactoryGirl.create(:user) }

  describe 'GET new' do
    before { get :new}
    it { should assign_to(:debates_point) }
    it { should render_template :new}
  end

  describe 'POST create' do
    let(:debate) { FactoryGirl.create(:debate) }
    let(:point) { FactoryGirl.create(:point) }
    let(:params) { Hash[debates_point: { debate_id: debate.id, point_id: point.id, supporting: true }] }
    it 'should create the debates_point' do
      expect { post :create, params }.to change{ DebatesPoint.count }.by(1)
    end

    context 'after creation' do
      before { post :create, params }
      it { should redirect_to debate_url(debate) }
    end

    context 'with validation errors' do
      before { DebatesPoint.any_instance.stub(:save).and_return(false) }
      before { post :create, params }
      it { should render_template :new}
    end
  end

  describe 'DELETE destroy' do
    let!(:debates_point) { FactoryGirl.create(:debates_point) }
    it 'should delete the debates_point record' do
      expect { delete :destroy, id: debates_point.id }.to change{ DebatesPoint.count }.by(-1)
    end
  end
end
