require 'rails_helper'

describe FriendshipsController, type: :controller do
  let(:current_member) { create(:member) }
  let(:friend)         { create(:member) }

  describe "POST #create" do
    it "should succeed" do
      post :create, params: { friendship: { member_id: current_member.id, friend_id: friend.id } }
      expect(response).to have_http_status(302)
      expect(flash["notice"]).to match("#{current_member.name} is now friends with #{friend.name}")
    end

    it "should fail" do
      post :create, params: { friendship: { member_id: current_member.id, friend_id: current_member.id } }
      expect(response).to have_http_status(302)
      expect(flash["alert"]).to match("Could not connect to member")
    end
  end
end
