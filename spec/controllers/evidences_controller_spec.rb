require 'spec_helper'

describe EvidencesController do
  before { sign_in FactoryGirl.create(:user) }

  describe "GET new" do
    before { get :new }
    it { should render_template :new }
    it { should assign_to(:evidence) }
  end

  describe "POST create" do
    let(:params) { Hash[evidence: FactoryGirl.attributes_for(:evidence)] }
    it 'should create the evidence' do
      expect { post :create, params }.to change{ Evidence.count }.by(1)
    end

    context 'without validation errors' do
      before { post :create, params }
      it { should assign_to(:evidence) }
      it { should redirect_to evidence_url(assigns[:evidence])}
    end

    context 'with validation errors' do
      before { Evidence.any_instance.stub(:save).and_return(false) }
      before { post :create, params }
      it { should render_template :edit }
    end
  end

  describe "GET edit" do
    let(:evidence) { FactoryGirl.create(:evidence) }
    before { get :edit, id: evidence.id }
    it { should render_template :edit }
    it { should assign_to(:evidence) }
  end

  describe "POST update" do
    let(:evidence) { FactoryGirl.create :evidence, title: 'original title' }
    let(:params) { Hash[id: evidence.id, evidence: { title: 'a newer title' }] }

    context 'without validation errors' do
      before { post :update, params }
      it { should redirect_to evidence_url(evidence) }
      it 'should update the evidence' do
        evidence.reload.title.should == 'a newer title'
      end
    end

    context 'with validation errors' do
      before { Evidence.any_instance.stub(:save).and_return(false) }
      before { post :update, params }
      it { should render_template :edit }
    end
  end

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

  describe "GET 'show'" do
    let(:evidence) { FactoryGirl.create(:evidence) }
    before { get :show, id: evidence.id }
    it { should assign_to(:evidence) }
    it { should render_template :show }
  end
end
