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

class Friendship < ApplicationRecord
  belongs_to :member
  belongs_to :friend, class_name: "Member"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverse, if: :has_inverse?

  def same_person?(m_id, f_id)
    m_id == f_id
  end

  private
  def create_inverse
    Friendship.create(inverse_params)
  end

  def destroy_inverse
    inverse.destroy
  end

  def has_inverse?
    Friendship.exists?(inverse_params)
  end

  def inverse
    Friendship.where(inverse_params)[0]
  end

  def inverse_params
    { friend_id: member_id, member_id: friend_id }
  end
end
