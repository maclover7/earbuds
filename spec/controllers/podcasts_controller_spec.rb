require 'rails_helper'
require 'factory_girl'

RSpec.describe PodcastsController, :type => :controller do

  describe "GET index" do
    it "assigns all podcasts as @podcasts" do
      podcast = FactoryGirl.create(:podcast) #attributes_for
      get :index, {}
      expect(assigns(:podcasts)).to eq([podcast])
    end
  end

  describe "GET show" do
    it "assigns the requested podcast as @podcast" do
      podcast = FactoryGirl.create(:podcast)
      get :show, {:id => podcast.to_param}
      expect(assigns(:podcast)).to eq(podcast)
    end
  end

  describe "GET new" do
    it "assigns a new podcast as @podcast" do
      get :new, {}
      expect(assigns(:podcast)).to be_a_new(Podcast)
    end
  end

  describe "GET edit" do
    it "assigns the requested podcast as @podcast" do
      podcast = FactoryGirl.create(:podcast)
      get :edit, {:id => podcast.to_param}
      expect(assigns(:podcast)).to eq(podcast)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Podcast" do
        expect {
          post :create, podcast: FactoryGirl.attributes_for(:podcast)
        } .to change(Podcast, :count).by(1)
      end

      it "assigns a newly created podcast as @podcast" do
        post :create, podcast: FactoryGirl.attributes_for(:podcast)
        expect(assigns(:podcast)).to be_a(Podcast)
        expect(assigns(:podcast)).to be_persisted
      end

      it "redirects to the created podcast" do
        post :create, podcast: FactoryGirl.attributes_for(:podcast)
        expect(response).to redirect_to(Podcast.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved podcast as @podcast" do
        post :create, podcast: FactoryGirl.attributes_for(:podcast, name: nil)
        expect(assigns(:podcast)).to be_a_new(Podcast)
      end

      it "re-renders the 'new' template" do
        post :create, podcast: FactoryGirl.attributes_for(:podcast, name: nil)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      before :each do
        @podcast = FactoryGirl.create(:podcast)
      end

      it "updates the requested podcast" do
        put :update, id: @podcast, podcast: FactoryGirl.attributes_for(:podcast, name: "TestApps")
        @podcast.reload
        @podcast.name.should eq("TestApps")
      end

      it "redirects to the podcast" do
        podcast = FactoryGirl.create(:podcast)
        put :update, {:id => podcast.to_param, :podcast => FactoryGirl.attributes_for(:podcast)}
        expect(response).to redirect_to(podcast)
      end
    end

    describe "with invalid params" do
      it "assigns the podcast as @podcast" do
        podcast = FactoryGirl.create(:podcast)
        put :update, {:id => podcast.to_param, :podcast => FactoryGirl.attributes_for(:podcast, name: nil)}
        expect(assigns(:podcast)).to eq(podcast)
      end

      it "re-renders the 'edit' template" do
        podcast = FactoryGirl.create(:podcast)
        put :update, {:id => podcast.to_param, :podcast => FactoryGirl.attributes_for(:podcast, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested podcast" do
      podcast = FactoryGirl.create(:podcast)
      expect {
        delete :destroy, {:id => podcast.to_param}
      }.to change(Podcast, :count).by(-1)
    end

    it "redirects to the podcasts list" do
      podcast = FactoryGirl.create(:podcast)
      delete :destroy, {:id => podcast.to_param}
      expect(response).to redirect_to(podcasts_url)
    end
  end

end
