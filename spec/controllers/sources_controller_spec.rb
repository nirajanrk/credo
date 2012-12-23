require 'spec_helper'

describe SourcesController do
  before { sign_in FactoryGirl.create(:user) }

  describe "GET new" do
    before { get :new }
    it { should render_template :new }
    it { should assign_to(:source) }
  end

  describe "POST create" do
    let(:params) { Hash[source: FactoryGirl.attributes_for(:source)] }
    it 'should create the source' do
      expect { post :create, params }.to change{ Source.count }.by(1)
    end

    context 'without validation errors' do
      before { post :create, params }
      it { should assign_to(:source) }
      it { should redirect_to source_url(assigns[:source])}
    end

    context 'with validation errors' do
      before { Source.any_instance.stub(:save).and_return(false) }
      before { post :create, params }
      it { should render_template :edit }
    end
  end

  describe "GET edit" do
    let(:source) { FactoryGirl.create(:source) }
    before { get :edit, id: source.id }
    it { should render_template :edit }
    it { should assign_to(:source) }
  end

  describe "POST update" do
    let(:source) { FactoryGirl.create :source, title: 'original title' }
    let(:params) { Hash[id: source.id, source: { title: 'a newer title' }] }

    context 'without validation errors' do
      before { post :update, params }
      it { should redirect_to source_url(source) }
      it 'should update the source' do
        source.reload.title.should == 'a newer title'
      end
    end

    context 'with validation errors' do
      before { Source.any_instance.stub(:save).and_return(false) }
      before { post :update, params }
      it { should render_template :edit }
    end
  end

  describe "DELETE destroy" do
    let!(:source) { FactoryGirl.create(:source) }
    it 'should delete the source' do
      expect { delete :destroy, id: source.id }.to change{ Source.count }.by(-1)
    end

    context 'after deletion' do
      before { delete :destroy, id: source.id }
      it { should redirect_to sources_url }
    end
  end

  describe "GET index" do
    before { get :index }
    it { should render_template :index }
    it { should assign_to(:sources) }
  end

  describe "GET show" do
    let(:source) { FactoryGirl.create(:source) }
    before { get :show, id: source.id }
    it { should assign_to(:source) }
    it { should render_template :show }
  end

end
