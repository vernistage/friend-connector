require 'rails_helper'

describe MembersController, type: :controller do
  let(:member) { create(:member) }
  before(:each) do
    @new_member = { member: { name: "name", website: "http://www.twitter.com" } }
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: @new_member
      expect(response).to have_http_status(302)
      expect(flash["notice"]).to match("Member successfully created")
    end

    it "should fail" do
      post :create, params: { member: { name: nil, website: nil, short_url: "", scraped_content: "" } }
      expect(response).to have_http_status(200)
      expect(flash["alert"]).to match("There was an error saving your information")
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: member.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #member_results" do
    it "returns http success" do
      get :member_results, params: { user_id: member.id, topic: "grass" }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:member_results)
    end
  end
end
