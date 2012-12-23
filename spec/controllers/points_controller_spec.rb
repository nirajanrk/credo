require 'spec_helper'

describe PointsController do
  before { sign_in FactoryGirl.create(:user) }

  describe "GET new" do
    before { get :new }
    it { should render_template :new }
    it { should assign_to(:point) }
  end

  describe "POST create" do
    let(:params) { Hash[point: FactoryGirl.attributes_for(:point)] }
    it 'should create the point' do
      expect { post :create, params }.to change{ Point.count }.by(1)
    end

    context 'without validation errors' do
      before { post :create, params }
      it { should assign_to(:point) }
      it { should redirect_to point_url(assigns[:point])}
    end

    context 'with validation errors' do
      before { Point.any_instance.stub(:save).and_return(false) }
      before { post :create, params }
      it { should render_template :edit }
    end
  end

  describe "GET edit" do
    let(:point) { FactoryGirl.create(:point) }
    before { get :edit, id: point.id }
    it { should render_template :edit }
    it { should assign_to(:point) }
  end

  describe "POST update" do
    let(:point) { FactoryGirl.create :point, title: 'original title' }
    let(:params) { Hash[id: point.id, point: { title: 'a newer title' }] }

    context 'without validation errors' do
      before { post :update, params }
      it { should redirect_to point_url(point) }
      it 'should update the point' do
        point.reload.title.should == 'a newer title'
      end
    end

    context 'with validation errors' do
      before { Point.any_instance.stub(:save).and_return(false) }
      before { post :update, params }
      it { should render_template :edit }
    end
  end

  describe "DELETE destroy" do
    let!(:point) { FactoryGirl.create(:point) }
    it 'should delete the point' do
      expect { delete :destroy, id: point.id }.to change{ Point.count }.by(-1)
    end

    context 'after deletion' do
      before { delete :destroy, id: point.id }
      it { should redirect_to points_url }
    end
  end

  describe "GET 'index'" do
    before { get :index }
    it { should render_template :index }
    it { should assign_to(:points) }
  end

  describe "GET 'show'" do
    let(:point) { FactoryGirl.create(:point) }
    before { get :show, id: point.id }
    it { should assign_to(:point) }
    it { should render_template :show }
  end
end
