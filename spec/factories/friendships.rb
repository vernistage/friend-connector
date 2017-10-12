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

FactoryGirl.define do
  factory :friendship do
    member_id 1
    friend_id 1
  end
end
