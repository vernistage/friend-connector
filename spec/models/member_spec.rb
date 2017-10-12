# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  website         :string           not null
#  short_url       :string           default(""), not null
#  scraped_content :text             default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

describe Member, type: :model do
  let(:member1) { create(:member) }
  let(:member2) { create(:member) }

  describe "Member can have bidirectional friendship" do
    it "new member initially has no friendships" do
      expect(member1.friends.any?).to be false
    end

    it "two members can be friends" do
      member1.friends << member2
      expect(member1.friends[0].id).to be member2.id
      expect(member2.friends[0].id).to be member1.id
    end
  end
end
