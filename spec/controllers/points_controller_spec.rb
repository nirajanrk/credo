require 'spec_helper'

describe PointsController do
  before { sign_in FactoryGirl.create(:user) }

  describe 'GET new' do
    let(:debate) { FactoryGirl.create(:debate) }
    before { get :new, debate_id: debate.id }
    it { should assign_to(:point) }
    it { should render_template :new}
  end

  describe 'POST create' do
    let(:debate) { FactoryGirl.create(:debate) }
    let(:evidence) { FactoryGirl.create(:evidence) }
    let(:params) { Hash[point: { debate_id: debate.id, evidence_id: evidence.id, supporting: true }, debate_id: debate.id] }
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

    context 'creating new evidence at the same time' do
      let(:evidence_attributes) do
        { title: "bla" }
      end
      let(:params) { Hash[point: { debate_id: debate.id, supporting: true, evidence_attributes: evidence_attributes }, debate_id: debate.id] }
      before { post :create, params }

      it 'should create the related evidence with the point' do
        debate.points.count.should == 1
        point = debate.points.last
        point.evidence.title.should == 'bla'
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:point) { FactoryGirl.create(:point) }
    it 'should delete the point record' do
      expect { delete :destroy, id: point.id, debate_id: point.debate_id }.to change{ Point.count }.by(-1)
    end
  end

  describe 'POST vote_up' do
    let(:point) { FactoryGirl.create(:point) }
    before { post :vote_up, { point_id: point.id, debate_id: point.debate_id } }
    subject { point }
    its(:votes_for) { should == 1 }
  end
end
