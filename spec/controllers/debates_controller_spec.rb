require 'spec_helper'

describe DebatesController do
  before { sign_in FactoryGirl.create(:user) }

  describe 'GET index' do
    before { get :index }
    it { should assign_to(:debates) }
    it { should render_template :index}
  end

  describe 'GET new' do
    before { get :new}
    it { should assign_to(:debate) }
    it { should render_template :new}
  end

  describe 'GET show' do
    let(:debate) { FactoryGirl.create(:debate) }
    before { get :show, id: debate.id }
    it { should render_template :show }
    it { should assign_to(:debate).with(debate) }
  end

  describe 'GET edit' do
    let(:debate) { FactoryGirl.create(:debate) }
    before { get :edit, id: debate.id }
    it { should render_template :edit }
    it { should assign_to(:debate).with(debate) }
  end

  describe 'POST update' do
    let(:debate) { FactoryGirl.create(:debate, title: 'some title') }
    let(:params) { Hash[id: debate.id, debate: { title: 'a newer title' }] }

    context 'without validation errors' do
      before { post :update, params}

      it { should redirect_to debate_path(assigns[:debate]) }
      it { should assign_to(:debate).with(debate) }
      it 'should update the debate' do
        debate.reload.title.should eq 'a newer title'
      end
    end

    context 'with validation errors' do
      before { Debate.any_instance.stub(:save).and_return(false) }
      before { post :update, params}
      it { should render_template :edit }
      it { should assign_to(:debate).with(debate) }
      it 'should not update the debate' do
        debate.reload.title.should eq 'some title'
      end
    end
  end

  describe 'POST create' do
    let(:params) { Hash[debate: { title: 'Sugary drinks are uniquely unhealthy therefore deserving limitation' }] }
    it 'should create the debate' do
      expect { post :create, params }.to change{ Debate.count }.by(1)
    end

    context 'after creation' do
      before { post :create, params }
      it { should redirect_to debate_path(assigns[:debate]) }
    end

    context 'with validation errors' do
      before { Debate.any_instance.stub(:save).and_return(false) }
      before { post :create, params }
      it { should render_template :edit }
    end
  end

  describe 'DELETE destroy' do
    let!(:debate) { FactoryGirl.create(:debate) }
    it 'should delete the debate record' do
      expect { delete :destroy, id: debate.id }.to change{ Debate.count }.by(-1)
    end
  end
end
