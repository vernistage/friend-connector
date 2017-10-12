# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Friendship, type: :model do
  let(:member1) { create(:member) }
  let(:member2) { create(:member) }
  let(:friendship)       { Friendship.new(member_id: member1.id, friend_id: member2.id) }

  describe "create friendship creates inverse friendship" do
    it "adds two friendships" do
      expect{ friendship.save }.to change{ Friendship.all.size }.by(2)
    end

    it "inverse relationship created" do
      friendship.save
      expect(Friendship.where({ member_id: friendship.friend_id, friend_id: friendship.member_id }).exists?).to be_truthy
    end
  end

  describe "destroy friendship destroys inverse friendship" do
    it "removes two friendships" do
      friendship.save
      expect{ Friendship.destroy(friendship.id) }.to change{ Friendship.all.size }.by(-2)
    end

    it "inverse relationship destroyed" do
      friendship.save
      Friendship.destroy(friendship.id)
      expect(Friendship.where({ member_id: friendship.friend_id, friend_id: friendship.member_id }).exists?).to be_falsey
    end
  end
end
